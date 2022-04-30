import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_full/models/category_model.dart';
import 'package:e_commerce_full/viewmodels/category_view_model.dart';
import 'package:equatable/equatable.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryViewModel _categoryRepository;
  StreamSubscription? _categorySubscription;

  CategoryBloc({required CategoryViewModel categoryRepository})
      : _categoryRepository = categoryRepository,
        super(CategoryLoading()) {
    on<LoadCategories>(_onLoadCategories);
    on<UpdateCategories>(_onUpdateCategories);
  }

  void _onLoadCategories(LoadCategories event, Emitter<CategoryState> emit) {
    _categorySubscription?.cancel();
    _categorySubscription = _categoryRepository.getAllCategories().listen(
          (products) => add(
            UpdateCategories(products),
          ),
        );
  }

  void _onUpdateCategories(
      UpdateCategories event, Emitter<CategoryState> emit) {
    emit(
      CategoryLoaded(categories: event.categories),
    );
  }
}
