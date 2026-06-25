import 'package:application/src/views/pin.dart';
import 'package:flutter/material.dart';
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
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imageActuelle),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(backgroundColor: Colors.transparent),

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
                "Récapitulatif",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Colors.blueAccent,
                ),
              ),

              Container(
                width: double.infinity,
                height: 200,
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        "Nom: ${student.lastName.toUpperCase()}",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        "Prénoms: ${student.firstName.toLowerCase()}",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        "Spécialité: ${student.training}",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        "Opération:",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                width: 150,
                height: 50,

                child: ElevatedButton(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//  actions: [
        //   IconButton(
        //     onPressed: () {}, 
        //     icon: Icon(Icons.menu)),


          // IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
          // IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
          // IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
          // IconButton(onPressed: () {}, icon: Icon(Icons.arrow_right))
    //]