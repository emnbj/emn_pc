import 'package:application/src/utils/consts.dart';
import 'package:application/src/views/forget.dart';
import 'package:application/src/views/identification.dart';
import 'package:application/src/views/modification.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final List<String> mesImages = [
    'assets/images/EMN-Referent-Digital.jpeg',
    'assets/images/emn-dclic.jpeg',
    'assets/images/EMN-TIT-3.jpeg',
  ];
  String imageActuelle = ' ';
  Timer? monChrono;

  @override
  void initState() {
    super.initState();
    imageActuelle = mesImages[0];
    monChrono = Timer.periodic(Duration(seconds: 5), (timer) {
      changerImage();
    });
  }

  void changerImage() {
    int indexAleatoire = Random().nextInt(mesImages.length);

    setState(() => imageActuelle = mesImages[indexAleatoire]);
  }

  @override
  void dispose() {
    monChrono?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imageActuelle),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Expanded(
              flex: 4,
              child: Image.asset(appLogo, color: Colors.white.withAlpha(50)),
            ),
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(20),

                child: Column(
                  children: [
                    Text(
                      "Bienvenue sur l'application de gestion des PC de l'EMN",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => Get.to(() => Identification()),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text("Déposer / Retirer un PC".toUpperCase()),
                    ),
                    SizedBox(height: 20),
                    OutlinedButton(
                      onPressed: () => Get.to(() => Modification()),
                      style: OutlinedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text("Modifier PIN"),
                    ),
                    SizedBox(height: 10),
                    TextButton(
                      onPressed: () => Get.to(() => ForgetPIN()),
                      child: const Text(
                        "PIN oublié ?",
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                    ),
                    Spacer(),
                    Text("© 2026 EMN - Tous droits réservés"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
