import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var currentNavIndex = 0.obs;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> getData() async {
    CollectionReference dataAnak = firestore.collection("data_anak");
    return dataAnak.get();
  }
  
  Future<QuerySnapshot<Object?>> getDataArticle() async {
    CollectionReference article = firestore.collection("article");
    return article.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference dataAnak = firestore.collection("data_anak");
    return dataAnak.orderBy("namaAnak").snapshots();
  }
  Stream<QuerySnapshot<Object?>> streamDataArticle() {
    CollectionReference article = firestore.collection("article");
    return article.snapshots();
  }

  void deleteData(String docId) async {
    DocumentReference docRef = firestore.collection("data_anak").doc(docId);
    try {
      Get.defaultDialog(
          title: "Delete",
          middleText: "Apakah anda yakin untuk menghapus data ini?",
          onConfirm: () async {
            await docRef.delete();
            Get.back();
          },
          textConfirm: "Ya",
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
    super.onInit();
  }


  @override
  void onClose() {
    super.onClose();
  }
}
