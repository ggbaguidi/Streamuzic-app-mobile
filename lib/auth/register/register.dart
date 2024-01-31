import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:musik/pages/choix_categories.dart';
import 'package:musik/utils/colors.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _Register();
}

class _Register extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmedPassword = TextEditingController();

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
                height: 700,
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
                        controller: _username,
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
                        controller: _email,
                        validator: ValidationBuilder()
                            .email('email incorrect')
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
                        controller: _password,
                        validator: ValidationBuilder()
                            .regExp(
                                RegExp(
                                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'),
                                'Mot de passe incorrect')
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
                          if (val != _password.text) {
                            return 'Incorrect';
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
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ChoixCategories()));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: buttonColor,
                        ),
                        child: const Padding(
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
