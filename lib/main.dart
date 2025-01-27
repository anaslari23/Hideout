import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/LoginScreen.dart';
import 'screens/signup/signup_name_screen.dart';
import 'screens/signup/signup_username_screen.dart';
import 'screens/signup/signup_phone_screen.dart';
import 'screens/home_feed_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hideout',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color(0xFF246BFD),
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
        colorScheme: ColorScheme.light(
          primary: const Color(0xFF246BFD),
          secondary: const Color(0xFF246BFD).withOpacity(0.1),
          surface: Colors.white,
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black.withOpacity(0.87)),
          bodyMedium: TextStyle(color: Colors.black.withOpacity(0.65)),
          titleLarge: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
          ),
        ),
        cardTheme: CardTheme(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          color: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: const Color(0xFF246BFD),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF246BFD),
        scaffoldBackgroundColor: const Color(0xFF121212),
        colorScheme: ColorScheme.dark(
          primary: const Color(0xFF246BFD),
          secondary: const Color(0xFF246BFD).withOpacity(0.1),
          surface: const Color(0xFF1E1E1E),
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white.withOpacity(0.87)),
          bodyMedium: TextStyle(color: Colors.white.withOpacity(0.65)),
          titleLarge: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
          ),
        ),
        cardTheme: CardTheme(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          color: const Color(0xFF1E1E1E),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: const Color(0xFF246BFD),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      themeMode: ThemeMode.system,
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => const SignupNameScreen(),
        '/signup/username': (context) => const SignupUsernameScreen(),
        '/signup/phone': (context) => const SignupPhoneScreen(),
        '/home_feed': (context) => const HomeFeedScreen(),
      },
    );
  }
}
