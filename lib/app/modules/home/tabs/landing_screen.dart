import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:survey/app/utils/constants.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/loading.dart';
import '../home_controller.dart';

class LandingScreen extends GetView<HomeController> {
  LandingScreen({super.key});
  final height = Get.mediaQuery.size.height * 1;
  final width = Get.mediaQuery.size.width * 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cCreamColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: cGreenColor),
              alignment: Alignment.centerLeft,
              width: double.infinity,
              child: Text(
                "Tentang Stunting",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot<Object?>>(
              stream: controller.streamDataArticle(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  var listData = snapshot.data!.docs;
                  return ListView.builder(
                      itemCount: listData.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
                            Get.toNamed(
                              Routes.DETAIL_ARTICLE,
                              arguments: listData[index].id,
                            );
                          },
                          title: Text(
                            "${(listData[index].data() as Map<String, dynamic>)["title"]}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${(listData[index].data() as Map<String, dynamic>)["subtitle"]}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                                maxLines: 2,
                              ),
                              const SizedBox(
                                  height:
                                      10) // Adjust the height for the desired gap
                            ],
                          ),
                          trailing: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Image.network(
                              ((listData[index].data()
                                          as Map<String, dynamic>)["image"]
                                      as String?) ??
                                  "",
                              width: 75.0,
                              height: 95.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      });
                }
                return const Loading();
              },
            ),
          ),
        ],
      ),
    );
  }
}
