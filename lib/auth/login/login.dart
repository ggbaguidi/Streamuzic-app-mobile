// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:musik/api/url.dart';
import 'package:musik/pages/accueil/accueil_screens.dart';
import 'package:musik/utils/colors.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });

    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();

    // Make a POST request to your backend API to authenticate the user
    final response = await http.post(
      Uri.https(baseUrl, "$basePath/login"),
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      // Successful login

      // Extract the token from the response body
      var token = jsonDecode(response.body)['token'];
      var payload = json.decode(
          ascii.decode(base64.decode(base64.normalize(token.split(".")[1]))));
      print(payload);

      // Decode the token to get the user information
      //final Map<String, dynamic> decodedToken = JwtDecoder.decode(token);

      // Navigate to the home screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AccueilHomePage()),
      );
    } else {
      // Failed login
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: buttonColor,
          content: const Text('Email ou mot de passe incorrect'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        toolbarHeight: 100.0,
        backgroundColor: backgroundColor,
        leading: BackButton(
          color: buttonColor,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text(
          'Connexion',
          style: TextStyle(color: buttonColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        // padding: EdgeInsets.only(left: 10, right: 10,top: 0),
                        child: Image.asset(
                          'assets/images/Rectangle 5.png',
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        // padding: EdgeInsets.only(left: 10, right: 10,top: 0),
                        child: Image.asset(
                          'assets/images/Rectangle 7.png',
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        // padding: EdgeInsets.only(left: 10, right: 10,top: 0),
                        child: Image.asset(
                          'assets/images/Rectangle 8.png',
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        // padding: EdgeInsets.only(left: 10, right: 10,top: 0),
                        child: Image.asset(
                          'assets/images/Rectangle 6.png',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(left: 50, right: 50, top: 30),
                    child: Text(
                      'Email',
                      style: TextStyle(
                        color: buttonColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60, right: 50),
                    child: TextFormField(
                      controller: _emailController,
                      validator:
                          ValidationBuilder().email('Email incorrect').build(),
                      decoration: InputDecoration(
                          hintText: 'Entrez votre email',
                          errorStyle: const TextStyle(fontSize: 18.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintStyle: const TextStyle(
                              color: placeholderColor, fontSize: 14)),
                      cursorColor: Colors.black, // Couleur du curseur
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 50, right: 50, top: 30),
                    child: Text(
                      'Mot de passe',
                      style: TextStyle(
                        color: buttonColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60, right: 50),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: 'Entrez votre mot de passe',
                          errorStyle: const TextStyle(fontSize: 18.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintStyle: const TextStyle(
                              color: placeholderColor, fontSize: 14)),
                      cursorColor: Colors.black, // Couleur du curseur
                    ),
                  ),
                  const SizedBox(height: 40),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState != null &&
                            _formKey.currentState!.validate()) {
                          _login();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColor,
                      ),
                      child: _isLoading
                          ? const CircularProgressIndicator(color: Colors.white,)
                          : const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30.0, vertical: 12.0),
                              child: Text(
                                'Se connecter',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
