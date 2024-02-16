import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:survey/app/routes/app_pages.dart';
import 'package:survey/app/utils/constants.dart';
import 'package:survey/app/utils/loading.dart';

import '../home_controller.dart';

class DataScreen extends GetView<HomeController> {
  const DataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: cCreamColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Text(
                "Data Stunting",
                style: GoogleFonts.poppins(
                  color: cDarkGreenColor,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot<Object?>>(
                stream: controller.streamData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    var listData = snapshot.data!.docs;
                    return ListView.builder(
                      itemCount: listData.length,
                      itemBuilder: (context, index) {
                        String namaAnak = (listData[index].data()
                            as Map<String, dynamic>)["namaAnak"];
                        RxList<String> words = namaAnak.split(' ').obs;
                        String firstWord = words.isNotEmpty ? words[0] : "";
                        return Card(
                            elevation: 2,
                            margin: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            child: ListTile(
                              onTap: () {
                                Get.toNamed(
                                  Routes.EDIT_DATA,
                                  arguments: listData[index].id,
                                );
                              },
                              title: Text(
                                "${(listData[index].data() as Map<String, dynamic>)["namaAnak"]}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              subtitle: Text(
                                "${(listData[index].data() as Map<String, dynamic>)["nik"]}",
                              ),
                              leading: CircleAvatar(
                                backgroundColor: cDarkGreenColor,
                                child: Text(firstWord.isNotEmpty
                                    ? firstWord[0].toUpperCase()
                                    : ""),
                              ),
                            ));
                      },
                    );
                  }
                  return const Loading();
                },
              ),
            ),
          ],
        ),
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          spaceBetweenChildren: 1,
          foregroundColor: Colors.black,
          spacing: 10,
          backgroundColor: cOrangeColor,
          overlayColor: Colors.black,
          overlayOpacity: 0,
          children: [
            SpeedDialChild(
              child: const Icon(Icons.add),
              backgroundColor: cGreenColor,
              label: "Tambah data",
              onTap: () => Get.toNamed(Routes.ADD_DATA),
            ),
            SpeedDialChild(
              child: const Icon(Icons.search),
              backgroundColor: Colors.grey,
              label: "Cari data",
              onTap: () => Get.toNamed(Routes.SEARCH_PAGE),
            ),
          ],
        ));
  }
}
