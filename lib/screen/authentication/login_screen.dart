import 'package:flutter/material.dart';
import 'package:my_first_project/app_styles.dart';
import 'package:my_first_project/components/components.dart';
import 'package:my_first_project/size_configs.dart';
import '../../services/auth_services.dart';
import '../../services/globals.dart';
import '../screens.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email = '';
  String _password = '';

  loginPressed() async {
    if (_email.isNotEmpty && _password.isNotEmpty) {
      http.Response response = await AuthServices.login(_email, _password);
      Map responseMap = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const HomeScreen(),
            ));
      } else {
        errorSnackBar(context, responseMap.values.first);
      }
    } else {
      errorSnackBar(context, 'Enter all required fields');
    }
  }

  List<FocusNode> _loginFocusNodes = [
    FocusNode(),
  ];

  @override
  void initState() {
    super.initState();
    _loginFocusNodes.forEach((element) {
      element.addListener(() {
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double height = SizeConfig?.blockSizeV ?? 0.0;
    return Stack(
      children: [
        Positioned(
          bottom: height * 8,
          child: Container(
            child: Image.asset('assets/images/login/login_bg.png'),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Welcome to\nTKids App',
                            style: kTitle1,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(24),
                                  topRight: Radius.circular(24),
                                ),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Hello again you\'ve been missed',
                                    style: kBodyText3,
                                  ),
                                  Divider(
                                    height: 30,
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Column(
                                      children: [
                                        TextField(
                                          decoration: const InputDecoration(
                                            hintText: 'Email',
                                            icon: Icon(Icons.person_sharp),
                                          ),
                                          onChanged: (value) {
                                            _email = value;
                                          },
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        TextField(
                                          decoration: InputDecoration(
                                            hintText: 'Password',
                                            icon: Icon(Icons.lock),
                                          ),
                                          obscureText: true,
                                          onChanged: (value) {
                                            _password = value;
                                          },
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        MyTextButton(
                                          buttonName: 'Login',
                                          onPressed: () => loginPressed(),
                                          bgColor: PrimaryColor,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
