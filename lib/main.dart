import 'package:daily_todo/data/providers/personal_task_provider.dart';
import 'package:daily_todo/pages/splash_screen.dart';
import 'package:daily_todo/services/storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

// ...

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Storage.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PersonalTaskProvider())
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true, fontFamily: 'Poppins',
        // primaryColor: const Color(0xFF9581FF),
        // scaffoldBackgroundColor: const Color(0xFFF6F6F6),
        // colorScheme: ColorScheme.fromSeed(
        //   primary: const Color(0xFF9581FF),
        //   secondary: const Color(0xFF0F071A),
        //   background: const Color(0xFF9581FF),
        //   surface: Colors.white,
        //   tertiary: const Color(0xFFFFC804),
        //   seedColor: const Color(0xFFF6F6F6),
        //   // primary: const Color.from
        // ),
      ),
      // ignore: prefer_const_constructors
      home: SplashScreen(),
    );
  }
}
