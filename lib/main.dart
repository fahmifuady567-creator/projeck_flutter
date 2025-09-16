import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart';
import 'home_page.dart';
import 'data/user_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  String? loggedInUserEmail = prefs.getString('loggedInUserEmail');
  
  String? loggedInUserFullName;
  if (isLoggedIn && loggedInUserEmail != null) {
    loggedInUserFullName = prefs.getString('userFullName_$loggedInUserEmail');
  }

  runApp(MyApp(
    isLoggedIn: isLoggedIn,
    loggedInUserFullName: loggedInUserFullName,
  ));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  final String? loggedInUserFullName;

  const MyApp({
    super.key,
    required this.isLoggedIn,
    this.loggedInUserFullName,
  });

  @override
  Widget build(BuildContext context) {
    Widget homeScreen;
    if (isLoggedIn && loggedInUserFullName != null) {
      homeScreen = HomePage(fullName: loggedInUserFullName!);
    } else {
      homeScreen = const LoginPage();
    }

    return MaterialApp(
      title: 'Flutter Login UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      debugShowCheckedModeBanner: false,
      home: homeScreen,
    );
  }
}