import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


import 'pages/home_page.dart';

void main ()async {
  WidgetsFlutterBinding.ensureInitialized();
  print("Début");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  print("Firebase OK");

  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ecole du numérique",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(),
        useMaterial3: true,

      ),
      home: HomePage(),
    );
  }
}