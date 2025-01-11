import 'package:delivery_app/features/authentication/views/signin/login_screen.dart';
import 'package:delivery_app/navigation_menu.dart';
import 'package:delivery_app/utils/constants/enums.dart';
import 'package:delivery_app/utils/storage/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class THelperFunctions {

  static Widget redirect(){
    final String? token = TCacheHelper.getData(key: 'token');
    if(token != null){
      return const NavigationMenu();
    }
    return const SigninScreen();
  }

  static String truncateText(String text, int maxLength){
    if(text.length < maxLength) {
      return text;
    }else{
      return '${text.substring(0, maxLength)} ....';
    }
  }

  static bool isDarkMode(BuildContext context){
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize(){
    return MediaQuery.of(Get.context!).size;
  }

  static double screenHeight(BuildContext? context){
    return MediaQuery.of(context ?? Get.context!).size.height;
  }

  static double screenWidth(BuildContext? context){
    return MediaQuery.of(context ?? Get.context!).size.width;
  }

  static String getFormattedDate(DateTime date, {String format = 'dd MMM yyyy'}){
    return DateFormat(format).format(date);
  }

  static List<T> removeDuplicates<T>(List<T> list){
    return list.toSet().toList();
  }

  static void updateApiStatus({required Rx<RequestState> target, required RequestState value}){
    target.value = value;
  }

  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize){
    final wrappedList = <Widget>[];
    for(var i=0 ; i<widgets.length ; i+=rowSize){
      final rowChildren = widgets.sublist(i, i+rowSize > widgets.length ? widgets.length : i+rowSize);
      wrappedList.add(Row(children: rowChildren,));
    }
    return wrappedList;
  }
}
