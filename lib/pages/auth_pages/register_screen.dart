import 'package:daily_todo/data/auth_data.dart';
import 'package:daily_todo/pages/auth_pages/login_screen.dart';
import 'package:daily_todo/pages/home_screen.dart';
import 'package:daily_todo/utils/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Map registerData = {};

  void _setRegisterData(Map data) {
    setState(() {
      users.value = data;
      currentUser.value = data;
    });
  }

  @override
  void initState() {
    super.initState();
    users.addListener(() {});
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Container(
          color: const Color(0xFFF6F6F6),
          padding: EdgeInsets.all(context.width * 0.05),
          height: context.height * 1,
          width: context.width * 1,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: context.height * 0.5,
                  child: const Image(
                    image: AssetImage("assets/images/register.png"),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: context.height * 0.32,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextFormField(
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
                            TextFormField(
                              controller: passwordController,
                              validator: (value) {
                                if (value!.length < 8) {
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
                            Padding(
                              padding: EdgeInsets.only(
                                bottom: context.height * 0.03,
                              ),
                              child: TextFormField(
                                controller: confirmPasswordController,
                                validator: (value) {
                                  if (value!.length < 8 ||
                                      confirmPasswordController.text !=
                                          passwordController.text) {
                                    return "Mot de passe incompatible";
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: EdgeInsets.all(15),
                                  hintText: "Confirm Password",
                                  hintStyle: TextStyle(
                                    height: 2,
                                    color: Color(0xffDDDADA),
                                    fontSize: 15,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
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
                    Gap(context.width * 0.02),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final username = usernameController.text;
                          final password = passwordController.text;
                          final confirmPassword =
                              confirmPasswordController.text;
                          registerData = {
                            'username': username,
                            'password': password,
                            'confirmPassword': confirmPassword
                          };
                          // debugPrint(registerData as String?);
                          _setRegisterData(registerData);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(milliseconds: 100),
                              content: Text("Envoi en cours"),
                            ),
                          );
                          // FocusScope.of(context)
                          //     .requestFocus(FocusNode);
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
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 17,
                          color: Color(0xFFF6F6F6),
                        ),
                      ),
                    ),
                    Gap(context.width * 0.03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.withOpacity(0.4)),
                        ),
                        GestureDetector(
                          onTap: () {
                            context.navToAndReplace(const LoginScreen());
                          },
                          child: const Text(
                            " Login",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF9581FF),
                            ),
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
