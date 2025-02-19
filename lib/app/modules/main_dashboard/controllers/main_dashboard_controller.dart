import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../contact/views/contact_view.dart';
import '../../home/views/about_us.dart';
import '../../home/views/home_view.dart';
import '../../portfolio/views/portfolio_view.dart';
import '../../service/views/service_view.dart';
import '../views/footer_class.dart';

class MainDashboardController extends GetxController {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();
  final ScrollController scrollController = ScrollController();

  final onMenuHover = Matrix4.identity()..scale(1.0);

  final menuItems = <String>[
    'Home',
    'About',
    'Services',
    'Portfolio',
    'Contact',
  ];

  final RxInt menuIndex = 0.obs;

  final screensList = <Widget>[
    const HomeView(),
    const AboutMe(),
    ServiceView(),
    const PortfolioView(),
    const ContactView(),
    const FooterClass(),
  ].obs;

  Future<void> scrollTo({required int index}) async {
    await itemScrollController.scrollTo(
      index: index,
      duration: const Duration(seconds: 2),
      curve: Curves.fastLinearToSlowEaseIn,
    );
    menuIndex.value = index;
  }
}
