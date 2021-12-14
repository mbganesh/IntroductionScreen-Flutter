import 'package:flutter/material.dart';
import 'package:intro_screen/HomeScreen.dart';
import 'package:intro_screen/OnBoardScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

int isSeen = 0;
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  isSeen = await pref.getInt("seen") ?? 0;
  await pref.setInt("seen", 1);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     initialRoute: isSeen == 0 || isSeen == 1 ? 'onBoard':'home',
     routes: {
       'onBoard':(context) => OnBoardScreen(),
       'home':(context) => HomePage(),
     },
    );
  }
}


