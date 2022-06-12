import 'package:flutter/material.dart';
import 'package:esthetic/screens/edit_profile.dart';
import 'package:esthetic/utilities/constants.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  runApp(MyApp());
  configLoading();
}
//void main() => runApp(MyApp());

void configLoading() {
  //test
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
  //..customAnimation = CustomAnimation();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Esthetic',
      theme: ThemeData(scaffoldBackgroundColor: kBackgroundColor, primaryColor: kPrimaryColor, textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor), visualDensity: VisualDensity.adaptivePlatformDensity),
      debugShowCheckedModeBanner: false,
      home: const EditProfilePage(),
      builder: EasyLoading.init(),
    );
  }
}
