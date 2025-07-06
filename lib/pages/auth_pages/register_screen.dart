import 'package:daily_todo/data/auth_data.dart';
import 'package:daily_todo/pages/auth_pages/login_screen.dart';
import 'package:daily_todo/pages/home_screen.dart';
import 'package:daily_todo/utils/build_context_extension.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with StateLoading {
  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Map registerData = {};

  void _setRegisterData(Map data) {
    setState(() {
      users.value = data;
      currentUser.value = data;
    });
  }

  String? _validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value!.isNotEmpty && !regex.hasMatch(value)
        ? 'Enter a valid email address'
        : null;
  }

  Future<void> _validateRegisterData() async {
    if (_formKey.currentState!.validate()) {
      final username = usernameController.text;
      final email = emailController.text;
      final password = passwordController.text;
      registerData = {
        'username': username,
        'password': password,
        'email': email
      };

      loading = true;

      _setRegisterData(registerData);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(milliseconds: 100),
          content: Text("Envoi en cours"),
        ),
      );
      // FocusScope.of(context)
      //     .requestFocus(FocusNode);

      try {
        // final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          debugPrint('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          debugPrint('The account already exists for that email.');
        }
      } catch (e) {
        debugPrint(e.toString());
      }

      Future.delayed(const Duration(milliseconds: 400), () {
        if (!mounted) return;
        context.navToview(const HomeScreen());
      });

      loading = true;
    }
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
    emailController.dispose();
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: context.height * 0.36,
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
                              controller: emailController,
                              validator: _validateEmail,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: EdgeInsets.all(15),
                                hintText: "Email",
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
                                prefixIcon: Icon(Icons.mail_outlined),
                                prefixIconColor: Color(0xffDDDADA),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                bottom: context.height * 0.03,
                              ),
                              child: TextFormField(
                                controller: passwordController,
                                validator: (value) {
                                  if (value!.length < 8) {
                                    return "Minimum 8 caractères";
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
                      onPressed: _validateRegisterData,
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
                              color: Colors.grey.withValues(alpha: 0.4)),
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
