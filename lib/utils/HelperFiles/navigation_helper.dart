import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

class NavigationHelpers {
  // static Future<dynamic> redirect(String route) async {
  //   var result = Get.toNamed(route,PageTransition(
  //     type: PageTransitionType.rightToLeft,
  //     duration: const Duration(milliseconds: 400),
  //     child: c,
  //   ));
  //   return result;
  // }

  static Future<dynamic> redirectto(Widget c) async {
    var result = Get.off(
      PageTransition(
        type: PageTransitionType.rightToLeft,
        duration: const Duration(milliseconds: 400),
        child: c,
      ),
    );
    return result;
  }
}
