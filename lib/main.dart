import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food/pages/landing_page.dart';
import 'package:food/firebase_options.dart';
import 'package:food/services/auth/auth_gate.dart';
import 'package:food/themes/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:food/models/restaurant.dart';
import 'package:device_preview/device_preview.dart'; // Import Device Preview
import 'package:flutter/foundation.dart'; // For kReleaseMode

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    DevicePreview(
      enabled: !kReleaseMode, // Disable Device Preview in release mode
      builder: (context) => MultiProvider(
        providers: [
          // Theme provider
          ChangeNotifierProvider(create: (context) => ThemeProvider()),

          // Restaurant provider
          ChangeNotifierProvider(create: (context) => Restaurant()),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Use Consumer to listen for changes in ThemeProvider.
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const AuthGate(),
          theme: themeProvider.themeData, // Access the theme from ThemeProvider
          useInheritedMediaQuery: true, // Required for Device Preview
          locale: DevicePreview.locale(context), // Set the locale to Device Preview's locale
          builder: DevicePreview.appBuilder, // Wrap your app with Device Preview
        );
      },
    );
  }
}
