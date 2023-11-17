import 'package:daily_todo/data/auth_data.dart';
import 'package:daily_todo/pages/auth_pages/register_screen.dart';
import 'package:daily_todo/pages/home_screen.dart';
import 'package:daily_todo/utils/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Map loginData = {};

  void _setCurrentUser(Map loginData) {
    setState(() {
      currentUser.value = loginData;
    });
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Container(
          color: const Color(0xFFF6F6F6),
          height: context.height * 1,
          width: context.width * 1,
          padding: EdgeInsets.all(context.width * 0.05),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: context.height * 0.5,
                  child: const Image(
                    image: AssetImage("assets/images/login.png"),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: context.height * 0.25,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: context.height * 0.01,
                                bottom: context.height * 0.01,
                              ),
                              child: TextFormField(
                                controller: usernameController,
                                validator: (value) {
                                  if (value!.length < 3 || value.isEmpty) {
                                    return "Minimun 3 caractères";
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: EdgeInsets.all(15),
                                  hintText: "Username",
                                  hintStyle: TextStyle(
                                    height: 2,
                                    color: Color(0xffDDDADA),
                                    fontSize: 15,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    borderSide: BorderSide.none,
                                  ),
                                  prefixIcon: Icon(Icons.person_outlined),
                                  prefixIconColor: Color(0xffDDDADA),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: context.height * 0.01,
                                bottom: context.height * 0.05,
                              ),
                              child: TextFormField(
                                controller: passwordController,
                                validator: (value) {
                                  if (value!.length < 8 || value.isEmpty) {
                                    return "Minimun 8 caractères";
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: EdgeInsets.all(15),
                                  hintText: "Password",
                                  hintStyle: TextStyle(
                                    height: 2,
                                    color: Color(0xffDDDADA),
                                    fontSize: 15,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    borderSide: BorderSide.none,
                                  ),
                                  prefixIcon: Icon(Icons.lock_outlined),
                                  prefixIconColor: Color(0xffDDDADA),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final username = usernameController.text;
                          final password = passwordController.text;
                          loginData = {
                            'username': username,
                            'password': password,
                          };
                          _setCurrentUser(loginData);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(milliseconds: 100),
                              content: Text("Envoi en cours"),
                            ),
                          );
                          Future.delayed(const Duration(milliseconds: 400), () {
                            context.navToview(const HomeScreen());
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF9581FF),
                        fixedSize: Size(
                          (context.width * 99),
                          (context.height * 0.07),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                      ),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 17,
                          color: Color(0xFFF6F6F6),
                        ),
                      ),
                    ),
                    Gap(context.height * 0.03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have account? ",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.withOpacity(0.4)),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.navToAndReplace(const RegisterScreen());
                          },
                          child: const Text(
                            " Sign up",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF9581FF)),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
