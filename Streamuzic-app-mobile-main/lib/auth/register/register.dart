import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:musik/api/url.dart';
import 'package:musik/pages/choix_categories.dart';
import 'package:musik/utils/colors.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _Register();
}

class _Register extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmedPassword = TextEditingController();
  bool _isLoading = false;

  Future<void> _register() async {
    setState(() {
      _isLoading = true;
    });

    final String username = _usernameController.text.trim();
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();

    // Make a POST request to your backend API to authenticate the user
    final response = await http.post(
      Uri.https(baseUrl, "$basePath/register"),
      body: {
        'username': username,
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      // Successful login

      // Extract the token from the response body
      var message = jsonDecode(response.body)['message'];
      print(message);

      // Decode the token to get the user information
      //final Map<String, dynamic> decodedToken = JwtDecoder.decode(token);

      // Navigate to the home screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ChoixCategories()),
      );
    } else {
      // Failed login
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: buttonColor,
          content: const Text('Email déjà là, pas besoin de vous inscrire à nouveau.'),
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
        title: Image.asset(
          'assets/images/logo.png',
          scale: 1.45,
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 800,
                decoration: const BoxDecoration(
                  color: formColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(left: 50, right: 50, top: 30),
                      child: Text(
                        'Username',
                        style: TextStyle(
                          color: buttonColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 60, right: 50),
                      child: TextFormField(
                        controller: _usernameController,
                        validator: ValidationBuilder()
                            .minLength(3, 'Au moins 3 caractères')
                            .build(),
                        decoration: InputDecoration(
                          hintText: 'Entrez votre nom d’utilisateur ',
                          hintStyle: const TextStyle(
                              color: placeholderColor, fontSize: 14),
                          filled: true,
                          fillColor: Colors.white,
                          errorStyle: const TextStyle(fontSize: 18.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        cursorColor: Colors.black, // Couleur du curseur
                      ),
                    ),
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
                        validator: ValidationBuilder()
                            .email('Email incorrect')
                            .build(),
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
                        'Password',
                        style: TextStyle(
                          color: buttonColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 60, right: 50),
                      child: TextFormField(
                        obscureText: true,
                        controller: _passwordController,
                        validator: ValidationBuilder()
                            .regExp(
                                RegExp(
                                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'),
                                '''Au moins un mot de passe
de 8 caractères, une lettre
magiscule, une lettre mini-
scule,un chiffre et un car-
actère, spécial(@?.)''')
                            .build(),
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
                    const Padding(
                      padding: EdgeInsets.only(left: 50, right: 50, top: 30),
                      child: Text(
                        'Confirm',
                        style: TextStyle(
                          color: buttonColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 60, right: 50),
                      child: TextFormField(
                        obscureText: true,
                        controller: _confirmedPassword,
                        validator: (val) {
                          if (val == null || val == "") {
                            return 'Est vide';
                          }
                          if (val != _passwordController.text) {
                            return 'Mot de passe incorrect';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Confirmez votre mot de passe',
                          errorStyle: const TextStyle(fontSize: 18.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintStyle: const TextStyle(
                              color: placeholderColor, fontSize: 14),
                        ),
                        cursorColor: Colors.black, // Couleur du curseur
                      ),
                    ),
                    const SizedBox(height: 40),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                        if (_formKey.currentState != null &&
                            _formKey.currentState!.validate()) {
                          _register();
                        }
                      },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: buttonColor,
                        ),
                        child: _isLoading
                          ? const CircularProgressIndicator(color: Colors.white,)
                          : const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 50.0, vertical: 12.0),
                          child: Text(
                            'S\'inscrire',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
