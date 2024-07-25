import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:red_house/firebase_options.dart';
import 'package:red_house/locator.dart';
import 'package:red_house/views/layout/layout_template.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .catchError((e) {
    return print("Error initializing Firebase: $e");
  });
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Red House Babes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: Theme.of(context).textTheme.apply(fontFamily: "Open Sans"),
        useMaterial3: true,
      ),
      home: const LayoutTemplate(),
    );
  }
}
