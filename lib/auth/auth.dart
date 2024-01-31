import 'package:flutter/material.dart';
import 'package:musik/auth/login/login.dart';
import 'package:musik/auth/register/register.dart';
import 'package:musik/utils/colors.dart';
import 'package:flutter_social_button/flutter_social_button.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _Auth();
}

double screenHeight = 0.0;

class _Auth extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Container(
                height: screenHeight * (1 - 1 / 4),
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/images/background.png"),
                  fit: BoxFit.cover,
                )),
                child: Container(
                  color: transparentColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 80.0,
                      ),
                      Image.asset("assets/images/logo.png"),
                      const Column(
                        children: [
                          SizedBox(
                            height: 50.0,
                          ),
                          Text("Decouvrez toutes vos musique.",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white,
                              )),
                          SizedBox(
                            height: 10.0,
                          ),
                          Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Wrap(
                                alignment: WrapAlignment.center,
                                children: [
                                  Text(
                                      "Ecoutez de la musique partout  et en tout le"),
                                  Text('temps avec vos prooches'),
                                ],
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                  //color: backgroundColor,
                  alignment: AlignmentDirectional.topCenter,
                  height: screenHeight / 4,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20.0)),
                    color: backgroundColor,
                  ),
                  child: const Column(
                    children: [
                      MyRegisterButton(),
                      SizedBox(
                        height: 50.0,
                      ),
                      Row(children: [
                        Expanded(
                            child: Divider(
                          color: buttonColor,
                          thickness: 2,
                          height: 5.0,
                          indent: 50,
                        )),
                        Text('OU'),
                        Expanded(
                            child: Divider(
                          color: buttonColor,
                          thickness: 2,
                          height: 5.0,
                          endIndent: 50,
                        )),
                      ])
                    ],
                  )),
            ],
          ),
          Container(
              color: backgroundColor,
              height: screenHeight / 4,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: FlutterSocialButton(
                          onTap: () {},
                          buttonType: ButtonType.google,
                          iconColor: Colors.white,
                          mini: true,
                        ),
                      ),
                      Expanded(
                        child: FlutterSocialButton(
                          onTap: () {},
                          buttonType: ButtonType.facebook,
                          iconColor: Colors.white,
                          mini: true,
                        ),
                      ),
                      Expanded(
                        child: FlutterSocialButton(
                          onTap: () {},
                          buttonType: ButtonType.apple,
                          iconColor: Colors.white,
                          mini: true,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 50.0),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Déjà un compte ?'),
                      SizedBox(
                        width: 8.0,
                      ),
                      MyLoginButton(),
                    ],
                  )
                ],
              )),
        ],
      ),
    );
  }
}

class MyRegisterButton extends StatelessWidget {
  const MyRegisterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20.0,
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Register()));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 12.0),
          child: Text(
            "S'inscrire",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class MyLoginButton extends StatelessWidget {
  const MyLoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: const Text(
        'Connectez-vous',
        style: TextStyle(color: buttonColor),
      ),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Login()));
      },
    );
  }
}
