import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  RxInt hitung = 0.obs;

  void increment() {
    if (hitung < 100) {
      hitung++;
    } else {
      Get.snackbar(
        "Stop",
        "Counter tidak boleh lebih dari 100",
        backgroundColor: Colors.red.shade700,
        icon: const Icon(Icons.warning_amber_rounded, color: Colors.white, size: 28),
        colorText: Colors.white,
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        borderRadius: 16,
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 2),
        snackStyle: SnackStyle.FLOATING,
        boxShadows: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      );
    }
  }

  void decrement() {
    if (hitung > 1) {
      hitung--;
    } else {
      Get.snackbar(
        "Stop",
        "Counter tidak boleh kurang dari 1",
        backgroundColor: Colors.red.shade700,
        icon: const Icon(Icons.warning_amber_rounded, color: Colors.white, size: 28),
        colorText: Colors.white,
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        borderRadius: 16,
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 2),
        snackStyle: SnackStyle.FLOATING,
        boxShadows: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      );
    }
  }
}