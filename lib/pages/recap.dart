import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class Recap extends StatefulWidget {
  const Recap({super.key});

  @override
  State<Recap> createState() => RecapState();
}

class RecapState extends State<Recap> {
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
          SizedBox(width: double.infinity, height: 50),
          Container(
            width: double.infinity,
            height: 50,
            alignment: Alignment.center,
            child: Text(
              "Récapitulatif",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w100),
            ),
          ),

          Container(
            width: double.infinity,
            height: 200,
            alignment: Alignment.center,
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    "Nom:",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    "Prénoms:",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    "Spécialité:",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    "Opération:",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.all(30),
            alignment: Alignment.center,
            child: SizedBox(
              width: 150,
              height: 50,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 112, 244, 241),
                ),

                onPressed: () {},
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
          ),
        ],
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