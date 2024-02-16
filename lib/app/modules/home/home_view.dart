import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:survey/app/modules/home/tabs/data_screen.dart';
import 'package:survey/app/modules/home/tabs/landing_screen.dart';
import 'package:survey/app/modules/home/tabs/profile_screen.dart';
import 'package:survey/app/utils/constants.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  final HomeController controll = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: cDarkGreenColor,
          title: Image.asset("assets/images/logo.png", height: 40),
          centerTitle: true,
        ),
        body: Obx(
          () => Column(
            children: [
              Expanded(
                child: _buildBody(controll.currentNavIndex.value),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            backgroundColor: cDarkGreenColor,
            selectedItemColor: cGreenColor,
            unselectedItemColor: Colors.white,
            showUnselectedLabels: false,
            currentIndex: controll.currentNavIndex.value,
            onTap: (index) {
              controll.currentNavIndex.value = index;
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.book_outlined),
                label: 'Data',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        ));
  }

  Widget _buildBody(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return LandingScreen();
      case 1:
        return const DataScreen();
      case 2:
        return ProfileScreen();
      default:
        return Container();
    }
  }
}
