import 'package:flutter/material.dart';
import 'package:photo_editor_vn/screens/start_screen.dart';
import 'package:photo_editor_vn/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:photo_editor_vn/providers/app_image_provider.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppImageProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo Editor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes:<String,WidgetBuilder>{
        '/': (_) => const StartScreen(),
        '/home': (_) => const HomeScreen()
      },
      initialRoute: '/',
    );
  }
}

