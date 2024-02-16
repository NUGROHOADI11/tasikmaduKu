import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:survey/app/components/my_textfield.dart';
import 'package:survey/app/utils/constants.dart';

import 'add_data_controller.dart';

class AddDataView extends GetView<AddDataController> {
  AddDataView({Key? key}) : super(key: key);
  final height = Get.mediaQuery.size.height * 1;
  final width = Get.mediaQuery.size.width * 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: cDarkGreenColor,
          title: const Text('Tambah Data'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            color: cCreamColor,
            padding: const EdgeInsets.all(20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                "Data Anak",
                style: GoogleFonts.poppins(
                  color: cDarkGreenColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Divider(
                height: 20,
                thickness: 2,
                color: cDarkGreenColor,
              ),
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                  icon: const Icon(Icons.add_card_outlined),
                  textInputType: TextInputType.number,
                  controller: controller.nikController,
                  hintText: "NIK",
                  obscureText: false),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                  icon: const Icon(Icons.add_card_sharp),
                  textInputType: TextInputType.number,
                  controller: controller.kkController,
                  hintText: "KK",
                  obscureText: false),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                  icon: const Icon(Icons.person),
                  textInputType: TextInputType.text,
                  controller: controller.namaAnakController,
                  hintText: "Nama Anak",
                  obscureText: false),
              const SizedBox(
                height: 20,
              ),
              DropdownButtonFormField<String>(
                value: controller.gender.value,
                onChanged: (selectedGender) {
                  controller.updateGender(selectedGender!);
                },
                hint: const Text("Gender"),
                items: ["Pilih", "Laki-laki", "Perempuan"].map((gender) {
                  return DropdownMenuItem<String>(
                    value: gender,
                    child: Text(gender),
                  );
                }).toList(),
                decoration: const InputDecoration(
                  labelText: 'Gender',
                  labelStyle: TextStyle(color: cDarkGreenColor),
                  prefixIconColor: cDarkGreenColor,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: cDarkGreenColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: cDarkGreenColor),
                  ),
                  prefixIcon: Icon(Icons.person_outline),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                  icon: const Icon(Icons.place_outlined),
                  textInputType: TextInputType.text,
                  controller: controller.tempatLahirController,
                  hintText: "Tempat Lahir Anak",
                  obscureText: false),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Tanggal Lahir",
                style: GoogleFonts.poppins(
                  color: cDarkGreenColor,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: cDarkGreenColor),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ListTile(
                  title: Obx(() => Text(
                        '${controller.selectedDate.value.day}/${controller.selectedDate.value.month}/${controller.selectedDate.value.year}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      )),
                  leading: const Icon(
                    Icons.calendar_today,
                    color: cDarkGreenColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: controller.selectedDate.value,
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                    builder: (BuildContext context, Widget? child) {
                      return Theme(
                        data: ThemeData.light().copyWith(
                          primaryColor:
                              cDarkGreenColor, // Header background color
                          hintColor: cDarkGreenColor, // Selection color
                          colorScheme:
                              const ColorScheme.light(primary: cDarkGreenColor),
                          buttonTheme: const ButtonThemeData(
                              textTheme: ButtonTextTheme.primary),
                        ),
                        child: child!,
                      );
                    },
                  );
                  if (pickedDate != null &&
                      pickedDate != controller.selectedDate.value) {
                    controller.updateSelectedDate(pickedDate);
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: cOrangeColor, // Text color of the button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // Rounded corners
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 25.0,
                  ),
                ),
                child: const Text(
                  'Pilih',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                  icon: const Icon(Icons.cake_outlined),
                  textInputType: TextInputType.number,
                  controller: controller.umurController,
                  hintText: "Umur Anak",
                  obscureText: false),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                  icon: const Icon(Icons.place),
                  textInputType: TextInputType.text,
                  controller: controller.alamatController,
                  hintText: "Alamat",
                  obscureText: false),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                  icon: const Icon(Icons.person),
                  textInputType: TextInputType.number,
                  controller: controller.tinggiController,
                  hintText: "Tinggi Badan",
                  obscureText: false),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                  icon: const Icon(Icons.person),
                  textInputType: TextInputType.number,
                  controller: controller.beratController,
                  hintText: "Berat Badan",
                  obscureText: false),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                  icon: const Icon(Icons.person),
                  textInputType: TextInputType.number,
                  controller: controller.lingkarKepalaController,
                  hintText: "Lingkar Kepala",
                  obscureText: false),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                  icon: const Icon(Icons.back_hand),
                  textInputType: TextInputType.number,
                  controller: controller.lingkarLenganController,
                  hintText: "Lingkar Lengan",
                  obscureText: false),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Data Ayah",
                style: GoogleFonts.poppins(
                  color: cDarkGreenColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Divider(
                height: 20,
                thickness: 2,
                color: cDarkGreenColor,
              ),
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                  icon: const Icon(Icons.person_3),
                  textInputType: TextInputType.text,
                  controller: controller.namaAyahController,
                  hintText: "Nama Ayah",
                  obscureText: false),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                  icon: const Icon(Icons.work),
                  textInputType: TextInputType.text,
                  controller: controller.pekerjaanAyahController,
                  hintText: "Pekerjaan Ayah",
                  obscureText: false),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                  icon: const Icon(Icons.bug_report),
                  textInputType: TextInputType.text,
                  controller: controller.riwayatPenyakitAyahController,
                  hintText: "Riwayat Penyakit Ayah",
                  obscureText: false),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Data Ibu",
                style: GoogleFonts.poppins(
                  color: cDarkGreenColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Divider(
                height: 20,
                thickness: 2,
                color: cDarkGreenColor,
              ),
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                  icon: const Icon(Icons.person_2),
                  textInputType: TextInputType.text,
                  controller: controller.namaIbuController,
                  hintText: "Nama Ibu",
                  obscureText: false),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                  icon: const Icon(Icons.work),
                  textInputType: TextInputType.text,
                  controller: controller.pekerjaanIbuController,
                  hintText: "Pekerjaan Ibu",
                  obscureText: false),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                  icon: const Icon(Icons.bug_report),
                  textInputType: TextInputType.text,
                  controller: controller.riwayatPenyakitIbuController,
                  hintText: "Riwayat Penyakit Ibu",
                  obscureText: false),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: cGreenColor,
                    padding: const EdgeInsets.symmetric(
                      vertical: 13.0,
                      horizontal: 40.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  onPressed: () async {
                    if (controller.nikController.text.isNotEmpty &&
                        controller.kkController.text.isNotEmpty &&
                        controller.namaAnakController.text.isNotEmpty &&
                        controller.tempatLahirController.text.isNotEmpty &&
                        controller.umurController.text.isNotEmpty &&
                        controller.alamatController.text.isNotEmpty &&
                        controller.tinggiController.text.isNotEmpty &&
                        controller.beratController.text.isNotEmpty &&
                        controller.lingkarKepalaController.text.isNotEmpty &&
                        controller.lingkarLenganController.text.isNotEmpty &&
                        controller.namaAyahController.text.isNotEmpty &&
                        controller.pekerjaanAyahController.text.isNotEmpty &&
                        controller
                            .riwayatPenyakitAyahController.text.isNotEmpty &&
                        controller.namaIbuController.text.isNotEmpty &&
                        controller.pekerjaanIbuController.text.isNotEmpty &&
                        controller
                            .riwayatPenyakitIbuController.text.isNotEmpty) {
                      controller.addData(
                          controller.nikController.text,
                          controller.kkController.text,
                          controller.namaAnakController.text,
                          controller.tempatLahirController.text,
                          controller.selectedDate.value.toString(),
                          int.parse(controller.umurController.text),
                          controller.alamatController.text,
                          double.parse(controller.tinggiController.text),
                          double.parse(controller.beratController.text),
                          double.parse(controller.lingkarKepalaController.text),
                          double.parse(controller.lingkarLenganController.text),
                          controller.namaAyahController.text,
                          controller.pekerjaanAyahController.text,
                          controller.riwayatPenyakitAyahController.text,
                          controller.namaIbuController.text,
                          controller.pekerjaanIbuController.text,
                          controller.riwayatPenyakitIbuController.text,
                          controller.gender.value);
                    } else {
                      Get.defaultDialog(
                          title: "Error",
                          middleText: "Harap isi semua data",
                          onConfirm: () {
                            Get.back();
                          },
                          textConfirm: "Kembali");
                    }
                  },
                  child: Text(
                    'Submit',
                    style: GoogleFonts.poppins(
                      fontSize: 17.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ));
  }
}
