import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_full/models/checkout_model.dart';
import 'package:flutter/material.dart';

class CheckOutViewModel {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> addCheckout(CheckoutModel checkout) {
    return _firebaseFirestore.collection('checkout').add(checkout.toDocument());
  }
}
