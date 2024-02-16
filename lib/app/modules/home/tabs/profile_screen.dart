import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:survey/app/utils/constants.dart';

import '../../../controllers/auth_controller.dart';
import '../../../controllers/image_picker.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final height = Get.mediaQuery.size.height * 1;
  final width = Get.mediaQuery.size.width * 1;
  final authControl = Get.find<AuthController>();
  final ImagePickerController imageControll = Get.put(ImagePickerController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: cCreamColor,
        child: Column(
          children: [
            Container(
              width: width,
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                color: clightgrey,
                image: DecorationImage(
                  opacity: 0.5,
                  image: NetworkImage(
                    "https://firebasestorage.googleapis.com/v0/b/stunting-dd9b2.appspot.com/o/logo.png?alt=media&token=a7eb6704-3a9e-4125-a121-e8fe540a46eb",
                  ),
                  fit: BoxFit.cover, // Adjust this based on your requirement
                ),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: cCreamColor,
                    radius: 50,
                    child: Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/stunting-dd9b2.appspot.com/o/logo.png?alt=media&token=a7eb6704-3a9e-4125-a121-e8fe540a46eb",
                      scale: 25,
                    ),
                  ),
                ],
              ),
            ),
            Card(
              color: cGreenColor,
              margin: const EdgeInsets.fromLTRB(10, 15, 10, 7.5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                title: Text(
                  "Admin",
                  style: GoogleFonts.poppins(
                      fontSize: 16.5,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
                subtitle: Text(
                  "Kader Tasikmadu",
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
              ),
            ),
            Card(
              color: cGreenColor,
              margin: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                title: Text(
                  "Instagram",
                  style: GoogleFonts.poppins(
                      fontSize: 16.5,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
                subtitle: Text(
                  "tasikmadu_125",
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
              ),
            ),
            Card(
              color: cGreenColor,
              margin: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                title: Text(
                  "Youtube",
                  style: GoogleFonts.poppins(
                      fontSize: 16.5,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
                subtitle: Text(
                  "Tasikmadu125",
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
              ),
            ),
            Card(
              color: cGreenColor,
              margin: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                title: Text(
                  "Website",
                  style: GoogleFonts.poppins(
                      fontSize: 16.5,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
                subtitle: Text(
                  "https://keltasikmadu.malangkota.go.id/",
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
              ),
            ),
            Card(
              color: cGreenColor,
              margin: const EdgeInsets.fromLTRB(10, 7.5, 10, 12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tentang Kelurahan",
                        style: GoogleFonts.poppins(
                            fontSize: 16.5,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                      Text(
                        "Tasikmadu adalah sebuah kelurahan di wilayah Kecamatan Lowokwaru, Kota Malang, Provinsi Jawa Timur.",
                        style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      )
                    ]),
              ),
            ),
            InkWell(
              onTap: () async {
                authControl.logout();
              },
              child: Container(
                  height: 40,
                  width: width * 0.8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: cDarkGreenColor),
                  child: Center(
                    child: Text(
                      "Logout",
                      style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
