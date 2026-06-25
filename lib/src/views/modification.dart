
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

class Modification extends StatefulWidget {
  const Modification({super.key});
  @override
  State<Modification> createState() => ModificationState();
}

class ModificationState extends State<Modification> {
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
    int index = Random().nextInt(mesImages.length);

    setState(() {
      imageActuelle = mesImages[index];
    });
  }

  @override
  void dispose() {
    monChrono?.cancel(); 
    super.dispose();     
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imageActuelle),
          fit: BoxFit.cover,
        ),
      ),
      child: 
    Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),

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

           Container(
            margin: EdgeInsets.all(10),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Ancien PIN",
                        hintText: "votre code",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Ce champs est obligatoire";
                        }
                        return null;
                      },
                    ),
                  ),

                  Container(
                      margin: EdgeInsets.all(10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Nouveau PIN",
                        hintText: "Code",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Ce champs est obligatoire";
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.all(10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Confirmer le PIN",
                        hintText: "Repeter le code",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Ce champs est obligatoire";
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(
            width: 200,
            height: 50,

            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:Color.fromARGB(255, 33, 243, 240),
              ),
              
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  print("god job");
                }
              },

              child: Text(
                "Enregistrer",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 17,
                ),
              ),
            ),
          ),          
          ],
        ),
      ),


    ),
    ) ;
  }
}
