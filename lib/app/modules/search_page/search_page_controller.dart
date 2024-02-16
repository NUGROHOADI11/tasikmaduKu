import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPageController extends GetxController {
  final searchQuery = ''.obs;
  late TextEditingController searchController;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> getData() async {
    CollectionReference dataAnak = firestore.collection("data_anak");
    return dataAnak.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference dataAnak = firestore.collection("data_anak");
    return dataAnak.orderBy("namaAnak").snapshots();
  }

  void updateSearchQuery(String query) {
    searchQuery.value = query;
  }

  @override
  void onInit() {
    searchController = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
