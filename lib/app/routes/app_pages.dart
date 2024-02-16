import 'package:get/get.dart';

import '../modules/add_data/add_data_binding.dart';
import '../modules/add_data/add_data_view.dart';
import '../modules/detail_article/bindings/detail_article_binding.dart';
import '../modules/detail_article/views/detail_article_view.dart';
import '../modules/edit_data/edit_data_binding.dart';
import '../modules/edit_data/edit_data_view.dart';
import '../modules/home/home_binding.dart';
import '../modules/home/home_view.dart';
import '../modules/login/login_binding.dart';
import '../modules/login/login_view.dart';
import '../modules/search_page/search_page_binding.dart';
import '../modules/search_page/search_page_view.dart';
import '../modules/signup/signup_binding.dart';
import '../modules/signup/signup_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.ADD_DATA,
      page: () => AddDataView(),
      binding: AddDataBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_DATA,
      page: () => const EditDataView(),
      binding: EditDataBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_PAGE,
      page: () => const SearchPageView(),
      binding: SearchPageBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_ARTICLE,
      page: () => DetailArticleView(),
      binding: DetailArticleBinding(),
    ),
  ];
}
