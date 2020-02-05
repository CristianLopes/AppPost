import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageService {
  static showSnackBar(String message) {
    Get.snackbar("Atenção", message, colorText: Colors.black);
  }
}
