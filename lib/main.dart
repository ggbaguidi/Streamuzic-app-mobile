import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musik/auth/auth.dart';
import 'package:musik/auth/login/login.dart';
import 'package:musik/auth/register/register.dart';
import 'package:musik/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
              bodyLarge: GoogleFonts.poppins(
                fontSize: 20,
              ),
              bodyMedium:
                  GoogleFonts.poppins(fontSize: 13, color: Colors.white))),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => const SplashScreen(),
        '/auth': (BuildContext context) => const Auth(),
        '/auth/register': (BuildContext context) => const Register(),
        '/auth/login': (BuildContext context) => const Login(),
      },
      //home: const SplashScreen(),
    );
  }
}
