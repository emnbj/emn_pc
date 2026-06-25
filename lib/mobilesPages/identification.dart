import 'package:application/mobilesPages/recap.dart';
import 'package:application/models/student.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

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
                'Identifiez - vous',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 50, height: 50),

              TextFormField(
                controller: pcIdController,
                keyboardType: TextInputType.number,

                decoration: const InputDecoration(
                  labelText: "Entrez l'identifiant du PC",
                  border: OutlineInputBorder(),
                  hintText: 'Ex: 15-2020',
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ce champ numérique est obligatoire !';
                  }
                  return null;
                },
              ),

              SizedBox(height: 50),
              Container(
                margin: EdgeInsets.only(left: 200),
                child: TextButton(
                  onPressed: () {
                    var stds = myStudents.where(
                      (s) => s.idPc == pcIdController.text,
                    );

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

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Recap(student: selectStudent),
                        ),
                      );
                    
                    }
                  },
                  child: const Row(
                    children: [
                      Text(
                        "Continuer",
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.arrow_right),
                    ],
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
