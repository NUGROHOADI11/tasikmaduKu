import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddDataController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  RxString gender = RxString("Pilih");
  void updateGender(String selectedGender) {
    gender.value = selectedGender;
  }
  Rx<DateTime> selectedDate = Rx<DateTime>(DateTime.now());
  void updateSelectedDate(DateTime newDate) {
    selectedDate.value = newDate;
  }

  late TextEditingController nikController;
  late TextEditingController kkController;
  late TextEditingController namaAnakController;
  late TextEditingController tempatLahirController;
  late TextEditingController catatanController;
  late TextEditingController umurController;
  late TextEditingController alamatController;
  late TextEditingController tinggiController;
  late TextEditingController beratController;
  late TextEditingController lingkarKepalaController;
  late TextEditingController lingkarLenganController;
  late TextEditingController namaAyahController;
  late TextEditingController pekerjaanAyahController;
  late TextEditingController riwayatPenyakitAyahController;
  late TextEditingController namaIbuController;
  late TextEditingController pekerjaanIbuController;
  late TextEditingController riwayatPenyakitIbuController;

  void addData(
      String nik,
      String kk,
      String namaAnak,
      String tempatLahir,
      String tanggalLahir,
      int umur,
      String alamat,
      double tinggi,
      double berat,
      double lingkarKepala,
      double lingkarLengan,
      String catatan,
      String namaAyah,
      String pekerjaanAyah,
      String riwayatPenyakitAyah,
      String namaIbu,
      String pekerjaanIbu,
      String riwayatPenyakitIbu,
      String gender) async {
    CollectionReference dataAnak = firestore.collection("data_anak");

    try {
      Timestamp dateNow = Timestamp.now();
      await dataAnak.add({
        'nik': nik,
        'kk': kk,
        'namaAnak': namaAnak,
        'gender': gender,
        'tempatLahir': tempatLahir,
        'tanggalLahir': tanggalLahir,
        'umur': umur,
        'alamat': alamat,
        'tinggi': tinggi,
        'berat': berat,
        'lingkarKepala': lingkarKepala,
        'lingkarLengan': lingkarLengan,
        'catatan': catatan,
        'namaAyah': namaAyah,
        'pekerjaanAyah': pekerjaanAyah,
        'riwayatPenyakitAyah': riwayatPenyakitAyah,
        'namaIbu': namaIbu,
        'pekerjaanIbu': pekerjaanIbu,
        'riwayatPenyakitIbu': riwayatPenyakitIbu,
        'createdAt': dateNow,
        'updatedAt': dateNow,
      });

      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil Menambah data",
          onConfirm: () {
            nikController.clear();
            kkController.clear();
            namaAnakController.clear();
            tempatLahirController.clear();
            catatanController.clear();
            umurController.clear();
            alamatController.clear();
            tinggiController.clear();
            beratController.clear();
            lingkarKepalaController.clear();
            lingkarLenganController.clear();
            namaAyahController.clear();
            pekerjaanAyahController.clear();
            riwayatPenyakitAyahController.clear();
            namaIbuController.clear();
            pekerjaanIbuController.clear();
            riwayatPenyakitIbuController.clear();
            Get.back();
            Get.back();
          },
          textConfirm: "Kembali");
    } catch (e) {
      Get.defaultDialog(
          title: "Error",
          middleText: "Terjadi kesalahan: $e",
          onConfirm: () {
            Get.back();
          },
          textConfirm: "Kembali");
    }
  }

  @override
  void onInit() {
    nikController = TextEditingController();
    kkController = TextEditingController();
    namaAnakController = TextEditingController();
    tempatLahirController = TextEditingController();
    catatanController = TextEditingController();
    umurController = TextEditingController();
    alamatController = TextEditingController();
    tinggiController = TextEditingController();
    beratController = TextEditingController();
    lingkarKepalaController = TextEditingController();
    lingkarLenganController = TextEditingController();
    namaAyahController = TextEditingController();
    pekerjaanAyahController = TextEditingController();
    riwayatPenyakitAyahController = TextEditingController();
    namaIbuController = TextEditingController();
    pekerjaanIbuController = TextEditingController();
    riwayatPenyakitIbuController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    nikController.dispose();
    kkController.dispose();
    namaAnakController.dispose();
    tempatLahirController.dispose();
    catatanController.dispose();
    umurController.dispose();
    alamatController.dispose();
    tinggiController.dispose();
    beratController.dispose();
    lingkarKepalaController.dispose();
    lingkarLenganController.dispose();
    namaAyahController.dispose();
    pekerjaanAyahController.dispose();
    riwayatPenyakitAyahController.dispose();
    namaIbuController.dispose();
    pekerjaanIbuController.dispose();
    riwayatPenyakitIbuController.dispose();
    super.onClose();
  }
}
