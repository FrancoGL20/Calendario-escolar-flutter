import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import './pages/landing_page.dart';
import './services/auth.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:flutter/services.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  ThemeData _buildAppTheme() {
    final ThemeData base = ThemeData.dark();
    return base.copyWith(
        brightness: Brightness.dark,
        primaryColor: const Color.fromARGB(255, 34, 255, 34),
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
          bodyText1: TextStyle(fontSize: 18.0),

        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
      create: (context) => Auth(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Calendario escolar',
        theme: _buildAppTheme(),
        home: LandingPage(),
      ),
    );
  }
}