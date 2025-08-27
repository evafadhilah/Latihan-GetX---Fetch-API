import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rpl1getx/app/modules/FormPendaftaran/views/results_screen_view.dart';

class FormPendaftaranController extends GetxController {
  
// rekreatif untuk field form
  RxString name = ''.obs;
  RxString gender = ''.obs;
  Rxn<DateTime> dateOfBirth = Rxn<DateTime>();
  RxString phone = ''.obs;

// untuk eror atauvalidasi
  RxString nameError = ''.obs;
  RxString genderError = ''.obs;
  RxString dateOfBirthError = ''.obs;
  RxString phoneError = ''.obs;
  

// fungsi validasi name
  void validateName({required String name}) {
    if (name.isEmpty) {
      nameError.value = 'Nama lengkap tidak boleh kosong';
    } else if (name.length < 3) {
      nameError.value = 'Nama lengkap minimal 3 karakter';
    } else {
      nameError.value = '';
    }
  }

  // fungsi validasi gender
  void validateGender({required String? jenisKelamin}) {
    if (jenisKelamin == null || jenisKelamin.isEmpty) {
      genderError.value = 'Jenis kelamin harus dipilih';
    } else {
      genderError.value = '';
    }
  }

  //
  void validateDateOfBirth({required DateTime? tanggalLahir}) {
    if (tanggalLahir == null) {
      dateOfBirthError.value = 'pilih tanggal lahir';
    } else {
      final now = DateTime.now();
      final age = now.year - tanggalLahir.year;
      if (age < 2 ) {
        dateOfBirthError.value = 'umur minimal 2 tahun';
        
      } else {
        dateOfBirthError.value = '';
      }
    }
  }

  void validatePhone({required String phone}) {
    if (!GetUtils.isPhoneNumber(phone)) {
      phoneError.value = 'nomor telepin tdk valid';
    } else {
      phoneError.value = '';
    }
  }

  void submitForm() {
    validateName(name: name.value);
    validateGender(jenisKelamin: gender.value);
    validateDateOfBirth(tanggalLahir: dateOfBirth.value);
    validatePhone(phone: phone.value);

    if (nameError.value.isEmpty 
    && genderError.value.isEmpty 
    && dateOfBirthError.value.isEmpty 
    && phoneError.value.isEmpty) {
      
  Get.to(
    () => ResultsScreenView(
      name: name.value,
      gender: gender.value,
      dateOfBirth: dateOfBirth.value!,
      phone: phone.value,
    ),
  );
} 

  }




  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  
}

