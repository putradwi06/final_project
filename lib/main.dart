import 'package:final_project/view/onboarding_page/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:final_project/view/login_page/login.dart';
import 'package:final_project/view/home.dart';
// import 'package:final_project/model/registerModel.dart';
// import 'package:final_project/view/Register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce Apps',
      // Gunakan TextTheme sesuai kebutuhan
      theme: ThemeData(
        useMaterial3: true,
        textTheme: TextTheme(
          titleLarge: GoogleFonts.montserrat(fontSize: 20),
          titleMedium: GoogleFonts.montserrat(fontSize: 16),
          titleSmall: GoogleFonts.montserrat(fontSize: 12),
          headlineLarge: GoogleFonts.hind(fontSize: 20),
          headlineMedium: GoogleFonts.hind(fontSize: 16),
          headlineSmall: GoogleFonts.hind(fontSize: 12),
          bodyLarge: GoogleFonts.montserrat(fontSize: 24),
          bodySmall: GoogleFonts.montserrat(fontSize: 8),
          labelLarge: GoogleFonts.hind(fontSize: 24),
          labelSmall: GoogleFonts.hind(fontSize: 8),
          // bodyMedium: ,
          // displayLarge: ,
          // displayMedium: ,
          // displaySmall: ,
          // labelMedium: ,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const OnBoarding(),
    );
  }
}

class CheckAuth extends StatefulWidget {
  const CheckAuth({super.key});

  @override
  _CheckAuthState createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  bool isAuth = false;

  @override
  void initState() {
    super.initState();
    _checkIfLoggedIn();
  }

  void _checkIfLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if (token != null) {
      if (mounted) {
        setState(() {
          print("token : $token");
          isAuth = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (isAuth) {
      child = const HomePage();
    } else {
      child = const LoginPage();
    }

    return Scaffold(
      body: child,
    );
  }
}
