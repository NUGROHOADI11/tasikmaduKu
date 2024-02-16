import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/my_textfield.dart';
import '../../controllers/auth_controller.dart';
import '../../routes/app_pages.dart';
import '../../utils/constants.dart';
import 'signup_controller.dart';

class SignupView extends GetView<SignupController> {
  final height = Get.mediaQuery.size.height * 1;
  final width = Get.mediaQuery.size.width * 1;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final authControl = Get.find<AuthController>();
  SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: cDarkGreenColor),
        child: Stack(
          children: [
            Image.asset(
              "assets/images/loginBG.jpg",
              width: width,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Expanded(
                  child: Container(
                height: height * 0.72,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Reset Password",
                                style: GoogleFonts.poppins(
                                  color: cDarkGreenColor,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          MyTextField(
                              icon: const Icon(Icons.email),
                              textInputType: TextInputType.emailAddress,
                              controller: emailController,
                              hintText: "Email",
                              obscureText: false),
                          const SizedBox(height: 40.0),
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
                                authControl.resetPassword(emailController.text);
                              },
                              child: Text(
                                'RESET',
                                style: GoogleFonts.poppins(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Kembali ke Halaman LOGIN >>',
                                style: GoogleFonts.poppins(
                                  color: cDarkGreenColor,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.toNamed(Routes.LOGIN);
                                },
                                child: Text(
                                  'LOGIN',
                                  style: GoogleFonts.poppins(
                                    color: cGreenColor,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ]),
                  ),
                ),
              )),
            )
          ],
        ),
      ),
    );
  }
}
