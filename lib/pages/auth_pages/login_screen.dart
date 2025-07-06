import 'package:daily_todo/data/auth_data.dart';
import 'package:daily_todo/pages/auth_pages/register_screen.dart';
import 'package:daily_todo/pages/home_screen.dart';
import 'package:daily_todo/utils/build_context_extension.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

mixin StateLoading {
  bool _loading = false;

  bool get loading => _loading;

  void setState(VoidCallback fn);

  set loading(bool value) {
    setState(() {
      _loading = value;
    });
  }
}

class _LoginScreenState extends State<LoginScreen> with StateLoading {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String error = "";

  Map loginData = {};

  void _setCurrentUser(Map loginData) async {
    if (_formKey.currentState!.validate()) {
      final username = emailController.text;
      final password = passwordController.text;
      loginData = {
        'username': username,
        'password': password,
      };
      setState(() {
        currentUser.value = loginData;
      });
      try {
        loading = true;

        // final credential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            duration: Duration(milliseconds: 100),
            content: Text("Envoi en cours"),
          ),
        );
        Future.delayed(const Duration(milliseconds: 400), () {
          if (!mounted) return;
          context.navToview(const HomeScreen());
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          setState(() {
            error = "No user found for that email.";
          });
        } else if (e.code == 'wrong-password') {
          setState(() {
            error = "Wrong password provided for that user.";
          });
        } else {
          setState(() {
            error = "Firebase error: ${e.message}";
          });
        }
      } catch (e) {
        setState(() {
          error = "Une erreur inconnue : $e";
        });
      }

      loading = false;
    }
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

  @override
  void initState() {
    super.initState();
    // currentUser.addListener(_setCurrentUser);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
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
                height: context.height * 0.48,
                child: const Image(
                  image: AssetImage("assets/images/login.png"),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: context.height * 0.33,
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
                                prefixIcon: Icon(Icons.mail_outline),
                                prefixIconColor: Color(0xffDDDADA),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: context.height * 0.01,
                              bottom: context.height * 0.07,
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
                  error.isNotEmpty
                      ? Text(
                          error,
                          style: const TextStyle(color: Colors.red),
                        )
                      : const SizedBox.shrink(),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final username = emailController.text;
                        final password = passwordController.text;
                        loginData = {
                          'username': username,
                          'password': password,
                        };
                        _setCurrentUser(loginData);
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
                    child: loading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : const Text(
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
                          color: Colors.grey.withValues(alpha: 0.4),
                        ),
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
                            color: Color(0xFF9581FF),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
