import 'package:application/src/views/identification.dart';
import 'package:application/src/views/modification.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

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

    setState(() {
      imageActuelle = mesImages[indexAleatoire];
    });
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
        body: Column(),
        bottomNavigationBar: Container(
          height: 300,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40.0),
            ),
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(30),

          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Identification()),
                    );
                  },
                  child: const Text("Dépot / Retrait PC"),
                ),
              ),
              SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Modification()),
                    );
                  },
                  child: const Text("Modifier PIN"),
                ),
              ),
              SizedBox(height: 30),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "PIN oublié?",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
