import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:musik/pages/accueil/accueil_screens.dart';
import 'package:musik/utils/colors.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

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
                      controller: _email,
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
                      controller: _password,
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
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AccueilHomePage()));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColor,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 12.0),
                        child: Text(
                          'Se connecter',
                          style: TextStyle(fontSize: 20, color: Colors.white),
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
