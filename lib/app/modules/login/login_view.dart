import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../components/my_textfield.dart';
import '../../routes/app_pages.dart';
import '../../utils/constants.dart';
import '../../controllers/auth_controller.dart';
import 'login_controller.dart';

class LoginView extends GetView<LoginController> {
  final height = Get.mediaQuery.size.height * 1;
  final width = Get.mediaQuery.size.width * 1;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final authControl = Get.find<AuthController>();
  LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Image.asset(
            "assets/images/loginBG.jpg",
            width: width,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
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
                            "Hi Admin,",
                            style: GoogleFonts.poppins(
                              color: cDarkGreenColor,
                              fontSize: 40.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "Selamat Datang di Aplikasi Stunting",
                            style: GoogleFonts.poppins(
                                color: cDarkGreenColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
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
                      const SizedBox(height: 20.0),
                      Text(
                        "Password",
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
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            color: clightgrey,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6.0,
                                offset: Offset(0, 2),
                              ),
                            ]),
                        height: 60.0,
                        child: Obx(
                          () => TextField(
                            keyboardType: TextInputType.text,
                            obscureText: authControl.isPasswordVisible.value,
                            controller: passwordController,
                            cursorColor: Colors.black,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'OpenSans',
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.only(top: 14.0),
                              prefixIcon: const Icon(Icons.password),
                              prefixIconColor: Colors.grey[700],
                              hintText: "Masukkan Password",
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                                fontFamily: 'OpenSans',
                              ),
                              suffixIcon: IconButton(
                                icon:  Icon(
                                      authControl.isPasswordVisible.value
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                onPressed: authControl.togglePasswordVisibility,
                              ),
                              suffixIconColor: Colors.grey[700],
                            ),
                          ),
                        ),
                      ),
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
                            if (emailController.text.isEmpty ||
                                passwordController.text.isEmpty) {
                              Get.snackbar(
                                'Error',
                                'Please enter both email and password.',
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                                snackPosition: SnackPosition.TOP,
                                duration: const Duration(seconds: 2),
                              );
                              return;
                            }
                            bool loginSuccess = await authControl.login(
                                emailController.text, passwordController.text);

                            if (loginSuccess) {
                              Get.snackbar(
                                'Success',
                                'Login successful!',
                                backgroundColor: Colors.green,
                                colorText: Colors.white,
                                snackPosition: SnackPosition.TOP,
                                duration: const Duration(seconds: 2),
                              );
                            } else {
                              Get.snackbar(
                                'Error',
                                'Login failed. Check your credentials.',
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                                snackPosition: SnackPosition.TOP,
                                duration: const Duration(seconds: 2),
                              );
                            }
                          },
                          child: Text(
                            'LOGIN',
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
                            'Lupa Password?',
                            style: GoogleFonts.poppins(
                              color: cDarkGreenColor,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.SIGNUP);
                            },
                            child: Text(
                              'RESET',
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
          ),
        )
      ],
    ));
  }
}
