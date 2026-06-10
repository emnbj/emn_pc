import 'package:application/pages/identification.dart';
import 'package:application/pages/modification.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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

      body: ListView(
        children: [

          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Identification()),
              );
            },
            child: Container(
              height: 150,
              width: double.infinity,
              margin: EdgeInsets.only(top: 50, left: 30, right: 30),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(205, 241, 236, 236),
                borderRadius: BorderRadius.all(Radius.circular(7)),
              ),
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/ordinateur.png",
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),

                  Row(
                    children: [
                      Text(
                        "Prendre un ordinateur",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_right),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          

          
          //prendre ou déposer un ordinateur
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Identification()),
              );
            },
            child: Container(
              height: 150,
              width: double.infinity,
              margin: EdgeInsets.only(top: 50, left: 30, right: 30),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(205, 241, 236, 236),
                borderRadius: BorderRadius.all(Radius.circular(7)),
              ),
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/ordinateur.png",
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),

                  Row(
                    children: [
                      Text(
                        "Déposer un ordinateur",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_right),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          
          

          //Modifier le code PIN
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Modification()),
              );
            },
            child: Container(
              height: 150,
              width: double.infinity,
              margin: EdgeInsets.only(top: 50, left: 30, right: 30),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(205, 241, 236, 236),
                borderRadius: BorderRadius.all(Radius.circular(7)),
              ),
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/pin.png",
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),

                  Row(
                    children: [
                      Text(
                        "Modifier le code PIN",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_right),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Container(
          //   height: 100,
          //   width: double.infinity,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.all(Radius.circular(20)),
          //   ),
          //   child: ElevatedButton(
          //     onPressed: () {},
          //     style: ElevatedButton.styleFrom(
          //       backgroundColor: Colors.blue
          //     ),
          //     child: Text("bouton"),

          //   ),
          // ),
        ],
      ),
    );
  }
}
