import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditDataController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  RxString selectedGender = RxString("Pilih");
  void updateGender(String gender) {
    selectedGender.value = gender;
  }

Rx<DateTime> selectedDate = Rx<DateTime>(DateTime.now());
  void updateSelectedDate(DateTime newDate) {
    selectedDate.value = newDate;
  }

  Future<DocumentSnapshot<Object?>> getData(String docId) async {
    DocumentReference docRef = firestore.collection("data_anak").doc(docId);
    var snapshot = await docRef.get();
    var data = snapshot.data() as Map<String, dynamic>;
    selectedGender.value = data["gender"] ?? "Pilih";
    return snapshot;
  }


  late TextEditingController nikController;
  late TextEditingController kkController;
  late TextEditingController namaAnakController;
  late TextEditingController tempatLahirController;
  late TextEditingController tanggalLahirController;
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

  void editData(
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
    String namaAyah,
    String pekerjaanAyah,
    String riwayatPenyakitAyah,
    String namaIbu,
    String pekerjaanIbu,
    String riwayatPenyakitIbu,
    String docId,
    String gender
  ) async {
    DocumentReference docData = firestore.collection("data_anak").doc(docId);

    try {
      Timestamp dateNow = Timestamp.now();
      await docData.update({
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
        'namaAyah': namaAyah,
        'pekerjaanAyah': pekerjaanAyah,
        'riwayatPenyakitAyah': riwayatPenyakitAyah,
        'namaIbu': namaIbu,
        'pekerjaanIbu': pekerjaanIbu,
        'riwayatPenyakitIbu': riwayatPenyakitIbu,
        'updatedAt': dateNow,
      });

      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil Mengubah data",
          onConfirm: () {
            nikController.clear();
            kkController.clear();
            namaAnakController.clear();
            tempatLahirController.clear();
            tanggalLahirController.clear();
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
          textConfirm: "Ya",
          onCancel: () {
            Get.back();
          },
          textCancel: "Tidak");
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
    tanggalLahirController = TextEditingController();
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
    tanggalLahirController.dispose();
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
