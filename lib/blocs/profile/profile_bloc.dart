import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_full/models/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../../core/repository/user_repository.dart';
import '../auth/auth_bloc.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final AuthBloc _authBloc;
  final UserRepository _userRepository;
  StreamSubscription? _authSubscription;

  ProfileBloc({
    required AuthBloc authBloc,
    required UserRepository userRepository,
  })  : _authBloc = authBloc,
        _userRepository = userRepository,
        super(ProfileLoading()) {
    on<LoadProfile>(_onLoadProfile);
    on<UpdateProfile>(_onUpdateProfile);

    _authSubscription = _authBloc.stream.listen((state) {
      if (state.user is AuthUserChanged) {
        if (state.user != null) {
          add(LoadProfile(state.authUser));
        }
      }
    });
  }

  void _onLoadProfile(LoadProfile event, Emitter<ProfileState> emit) {
    //Auth user returns null check this..
    if (event.authUser != null) {
      _userRepository.getUser(event.authUser!.uid).listen((user) {
        add(UpdateProfile(user: user));
      });
    } else {
      emit(ProfileUnauthenticated());
    }
  }

  void _onUpdateProfile(UpdateProfile event, Emitter<ProfileState> emit) {
    _userRepository.updateUser(event.user);
    emit(ProfileLoaded(user: event.user));
  }

  @override
  Future<void> close() async {
    _authSubscription?.cancel();
    super.close();
  }
}
