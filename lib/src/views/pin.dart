import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'dart:math';
import 'dart:async';

class Pin extends StatefulWidget {
  const Pin({super.key});
  @override
  State<Pin> createState() => _PinState();
}

class _PinState extends State<Pin> {
  final List<String> mesImages = [
    'assets/images/emn-dclic.jpeg',
    'assets/images/EMN-Referent-Digital.jpeg',
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
    if (!mounted) return; 

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
          height: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(30),

          child: Column(
            children: [
              Text(
                'Votre PIN pour terminer',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 50),
              Pinput(onCompleted: (pin) => print(pin)),

              SizedBox(height: 50),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 45, 194, 170),
                ),
                onPressed: () {},
                child: const Text(
                  "Terminer",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
