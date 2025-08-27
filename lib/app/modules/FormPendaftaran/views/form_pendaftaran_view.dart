import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/form_pendaftaran_controller.dart';

class FormPendaftaranView extends GetView<FormPendaftaranController> {
  const FormPendaftaranView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FormPendaftaranController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Pendaftaran'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // TextField Nama Lengkap
              Obx(
                () => TextField(
                  onChanged: (value) {
                    controller.name.value = value;
                    controller.validateName(name: value);
                  },
                  decoration: InputDecoration(
                    labelText: 'Nama Lengkap',
                    errorText: controller.nameError.value.isEmpty
                        ? null
                        : controller.nameError.value,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Dropdown Jenis Kelamin
              Obx(
                () => DropdownButtonFormField<String>(
                  value: controller.gender.value.isEmpty
                      ? null
                      : controller.gender.value,
                  hint: const Text('Pilih Jenis Kelamin'),
                  items: ['Laki-Laki', 'Perempuan']
                      .map(
                        (gender) => DropdownMenuItem(
                          value: gender,
                          child: Text(gender),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    controller.gender.value = value ?? '';
                    
                    // controller.validateGender(value); // kalau ada validasi bisa dipanggil di sini
                  },
                  decoration: InputDecoration(
                    labelText: 'jenis kelamin',
                    errorText: controller.genderError.value.isNotEmpty
                    ? controller.genderError.value : null,
                  ),
                ),
              ),
              Obx(
                () => ListTile(
                  title: Text(
                    controller.dateOfBirth.value == null ?
                    'pilih tanggal lahir' : DateFormat('dd-MM-yyyy')
                    .format(controller.dateOfBirth.value!),
                  ),
                  trailing: Icon(Icons.calendar_today),
                  onTap: () async {
                    final selectedDate = await showDatePicker(context: context, initialDate: DateTime.now(),
                     firstDate: DateTime(2020), lastDate: DateTime.now());
                     if (selectedDate != null) {
                        controller.dateOfBirth.value = selectedDate;
                        controller.validateDateOfBirth(tanggalLahir: selectedDate);
                      }
                  },

                  subtitle: controller.dateOfBirthError.value.isNotEmpty
                  ? Text(
                    controller.dateOfBirthError.value,
                    style: TextStyle(color: Colors.amberAccent),
                  )
                  :null
                ),
              ),
              Obx(
                  () => TextField(
                    onChanged: (value) {
                      controller.phone.value = value;
                      controller.validatePhone(phone: value);
                    },
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Nomor Telepon',
                      errorText: controller.phoneError.value.isNotEmpty
                          ? controller.phoneError.value
                          : null,
                    ),
                  ),
                ),
              // Tombol Submit
              Obx(
                () => SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: controller.nameError.value.isEmpty &&
                            controller.genderError.value.isEmpty &&
                            controller.dateOfBirthError.value.isEmpty &&
                            controller.phoneError.value.isEmpty &&
                            controller.name.value.isNotEmpty
                        ? () {
                            controller.submitForm();
                          }
                        : null,
                    child: const Text('Submit'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
