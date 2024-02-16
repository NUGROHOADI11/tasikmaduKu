import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:survey/app/utils/loading.dart';

import '../../../utils/constants.dart';
import '../controllers/detail_article_controller.dart';

class DetailArticleView extends GetView<DetailArticleController> {
  DetailArticleView({Key? key}) : super(key: key);
  final height = Get.mediaQuery.size.height * 1;
  final width = Get.mediaQuery.size.width * 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cDarkGreenColor,
        title: const Text('Article'),
        centerTitle: true,
      ),
      body: FutureBuilder<DocumentSnapshot<Object?>>(
        future: controller.getDataArticle(Get.arguments),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var data = snapshot.data!.data() as Map<String, dynamic>;

            return Stack(
              children: [
                SizedBox(
                  width: width,
                  child: Image.network(
                    data["image"],
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                      color: cGreenColor,
                    ),
                    height: height * 0.62,
                    width: width,
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data["title"]?.toString() ?? "",
                              style: GoogleFonts.poppins(
                                color: cDarkGreenColor,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text("Source: ${data["source"]?.toString() ?? ""}"),
                            const Divider(
                              height: 20,
                              thickness: 2,
                              color: cDarkGreenColor,
                            ),
                            Text(
                              data["subtitle"]?.toString() ?? "",
                              style: GoogleFonts.poppins(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w400,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              data["title_detail1"]?.toString() ?? "",
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.poppins(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              data["detail1"]?.toString() ?? "",
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.poppins(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              data["title_detail2"]?.toString() ?? "",
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.poppins(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              data["detail2"]?.toString() ?? "",
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.poppins(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
          }
          return const Loading();
        },
      ),
    );
  }
}
