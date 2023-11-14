import 'package:daily_todo/pages/auth_pages/register_screen.dart';
import 'package:daily_todo/pages/home_screen.dart';
import 'package:daily_todo/utils/build_context_extension.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Container(
          color: const Color(0xFFF6F6F6),
          padding: EdgeInsets.all(context.width * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: context.height * 0.5,
                child: const Image(
                  image: AssetImage("assets/images/login.png"),
                ),
              ),
              Expanded(
                // height: context.height * 0.18,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: context.height * 0.18,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextField(
                            controller: usernameController,
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
                          TextField(
                            controller: passwordController,
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
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.navToview(const HomeScreen());
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have account?",
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
