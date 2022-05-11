import 'package:flutter/material.dart';


abstract class StyleFormSealsPage {
  static const TextStyle textName = TextStyle(
      fontFamily: 'Montserrat',
      color: Colors.black,
      fontSize: 30,
      height: 0.5,
      fontWeight: FontWeight.w600);

  static const TextStyle textBody = TextStyle(
      fontFamily: 'Montserrat',
      color: Colors.black,
      fontSize: 15,
      fontWeight: FontWeight.w400);

  static double heightBetwItem = 20;

  static double borderRadText  = 15;

  static double heightItem= 60;

  static String  textNamePage= "Деталі про форму";

  static String  textBodyNameForm = "Форма про пломбу";
}



abstract class StyleSealsPage {

  static const TextStyle textCard = TextStyle(
      fontFamily: 'Montserrat',
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.w400);

  static String  textNamePage = "Список пломб";


}


abstract class StyleSettingPage  {

  static const TextStyle textButton = TextStyle(
      fontSize: 14,
      letterSpacing: 2.2,
      color: Colors.white
  );

  static const TextStyle textBody = TextStyle(
      color: Colors.black,
      fontSize: 16.0,
      fontWeight: FontWeight.bold
  );

  static Color activeButtn = Colors.green;

  static Color notActiveButtn = Colors.grey;

  static Color cursorColor = Colors.white;

  static Color iconColor = Colors.black;

  static Color BorderSide = Colors.black;

  static Color notActiveText = Colors.grey;

  static double heightBetwItem = 20;

  static double borderRadButton  = 20;

  static double heightBtwButtItem= 60;

  static String  textNamePage = "Налаштування";
}


abstract class StyleNavigatorText {

  static const TextStyle textBody = TextStyle(
      fontFamily: 'Montserrat',
      color: Colors.black,
      fontSize: 25,
      fontWeight: FontWeight.w400);

  static double heightBetwCont = 20;
}
