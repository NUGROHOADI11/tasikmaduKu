import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../routes/app_pages.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  Stream<User?> get streamAuthStatus => auth.authStateChanges();
  Future<bool> login(String email, String pass) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );
      Get.offAllNamed(Routes.HOME);
      return true; // Indicate login success
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.defaultDialog(
            title: "Error",
            middleText: "Terjadi kesalahan: $e",
            onConfirm: () {
              Get.back();
            },
            textConfirm: "Kembali");
      } else if (e.code == 'wrong-password') {
        Get.defaultDialog(
            title: "Error",
            middleText: "Terjadi kesalahan: $e",
            onConfirm: () {
              Get.back();
            },
            textConfirm: "Kembali");
      }
      return false; // Indicate login failure
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }

  void resetPassword(String email) async {
    if (email != "" && GetUtils.isEmail(email) ) {
      try {
        
        await auth.sendPasswordResetEmail(email: email);
        Get.defaultDialog(
          title: "Berhasil",
          middleText: "Kami telah Mengirimkan reset Password ke email: $email",
          onConfirm: () {
            Get.back();
            Get.back();
          },
          textConfirm: "Ya, Saya Mengerti");
      } catch (e) {
        Get.defaultDialog(
          title: "Error",
          middleText: "Terjadi kesalahan: $e",
          onConfirm: () {
            Get.back();
          },
          textConfirm: "Kembali");
      } 
    } else {
      Get.defaultDialog(
          title: "Error",
          middleText: "Email tidak Valid",
          onConfirm: () {
            Get.back();
          },
          textConfirm: "Kembali");
    }
  }

  Future<bool> signup(String email, String pass) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      Get.offAllNamed(Routes.LOGIN);
      return true; // Indicate login success
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.defaultDialog(
            title: "Error",
            middleText: "Terjadi kesalahan: $e",
            onConfirm: () {
              Get.back();
            },
            textConfirm: "Kembali");
      } else if (e.code == 'email-already-in-use') {
        Get.defaultDialog(
            title: "Error",
            middleText: "Terjadi kesalahan: $e",
            onConfirm: () {
              Get.back();
            },
            textConfirm: "Kembali");
      }
      return false; // Indicate login failure
    }
  }
}
