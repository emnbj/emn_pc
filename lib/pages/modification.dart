

import 'package:flutter/material.dart';

class Modification extends StatefulWidget {
  const Modification({super.key});
  @override
  State<Modification> createState() => ModificationState();
}

class ModificationState extends State<Modification> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset("assets/images/emn.png"),
        title: Column(
          children: [
            Text(
              "ECOLE DES MÉTIERS DU",
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),

            Text(
              "numérique",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),

      
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 50,
          ),

          Container(
            margin: EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Votre code actuel",
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
                      margin: EdgeInsets.all(20),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Nouveau code",
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
                      margin: EdgeInsets.all(20),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Confirmer le code",
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
            width: double.infinity,
            height: 30,
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
    );
  }
}
