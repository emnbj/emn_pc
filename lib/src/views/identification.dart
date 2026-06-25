import 'package:application/src/views/recap.dart';
import 'package:application/src/models/student.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

import 'package:get/get.dart';

class Identification extends StatefulWidget {
  const Identification({super.key});

  @override
  State<Identification> createState() => IdentificationState();
}

class IdentificationState extends State<Identification> {
  final TextEditingController pcIdController = TextEditingController();

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

    setState(() => imageActuelle = mesImages[indexAleatoire]);
  }

  @override
  void dispose() {
    monChrono?.cancel();
    super.dispose();
  }

  onSubmit() {
    var stds = myStudents.where((s) => s.idPc == pcIdController.text);

    if (stds.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Numéro de PC introuvable"),
          content: Text("Veuillez vérifier puis reessayer."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Fermer"),
            ),
          ],
        ),
      );
    } else {
      Student selectStudent = stds.first;

      Get.to(() => Recap(student: selectStudent));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Identification")),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imageActuelle),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(child: Container()),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(30),

                child: Column(
                  children: [
                    Text(
                      "Veuillez saisir l'identifiant du PC puis continuer"
                          .toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        height: 1.2,
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 20),

                    TextFormField(
                      controller: pcIdController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Entrez l'identifiant du PC",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        hintText: 'Ex: 15-2020',
                      ),

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ce champ numérique est obligatoire !';
                        }
                        return null;
                      },
                      onSaved: (value) => onSubmit(),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: ElevatedButton.icon(
                        onPressed: () => onSubmit(),
                        icon: Icon(Icons.chevron_right),
                        iconAlignment: IconAlignment.end,
                        label: Text("Continuer"),
                      ),
                    ),
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
