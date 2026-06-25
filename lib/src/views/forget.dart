import 'package:flutter/material.dart';

class ForgetPIN extends StatefulWidget {
  const ForgetPIN({super.key});

  @override
  State<ForgetPIN> createState() => _ForgetPINState();
}

class _ForgetPINState extends State<ForgetPIN> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(width: 100, height: 100),
          Center(
            child: Container(
              width: double.infinity,
              height: 100,
              padding: EdgeInsets.all(30),
              child: Text(
                "Veuillez vous rapprocher du service informatique de l'école ",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
