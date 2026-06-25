import 'package:application/src/utils/consts.dart';
import 'package:application/src/views/pin.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'dart:math';
import 'dart:async';
import '../models/student.dart';

class Recap extends StatefulWidget {
  final Student student;

  const Recap({super.key, required this.student});

  @override
  State<Recap> createState() => RecapState();
}

class RecapState extends State<Recap> {
  Student get student => widget.student;
  final TextEditingController pinController = TextEditingController();

  final List<String> mesImages = [
    'assets/images/EMN-TIT-3.jpeg'
        'assets/images/EMN-Referent-Digital.jpeg',
    'assets/images/emn-dclic.jpeg',
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
    return Scaffold(
      appBar: AppBar(title: Text("Récapitulatif")),
      backgroundColor: Colors.white,

      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)],
            ),
            child: ListTile(
              title: Text("Identité de l'étudiant", style: appStyleBold),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Nom: ${student.lastName.toUpperCase()}"),
                  Text("Prénoms: ${student.firstName.toLowerCase()}"),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)],
            ),
            child: ListTile(
              title: Text("Autres Informations", style: appStyleBold),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Matricule: ${student.matricule}"),
                  Text("Spécialité: ${student.training}"),
                  Text("Cohorte: ${student.cohorte}"),
                ],
              ),
            ),
          ),
          Container(
            // padding: EdgeInsets.all(12),
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: secondary,
              boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)],
            ),
            child: ListTile(
              textColor: Colors.white,
              title: Text("Type d'opération", style: appStyleBold),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Type d'opération: Dépôt / Retrait PC"),
                  Text("Date et Heure: ${DateTime.now()}"),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Veuillez entrer votre code PIN pour confirmer l'opération:",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 20),
          Pinput(
            onCompleted: (value) => print("Code PIN entré: $value"),
            autofocus: true,
            controller: pinController,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 12, 193, 230),
            ),

            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Pin()),
              );
            },
            child: Text(
              "Valider",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
