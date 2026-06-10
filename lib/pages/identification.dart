// import 'package:application/pages/modification.dart';
import 'package:application/pages/recap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Identification extends StatefulWidget {
  const Identification({super.key});

  @override
  State<Identification> createState() => identificationState();
}

class identificationState extends State<Identification> {
  List<DropdownMenuItem<String>> listId = [];
  String? def;

  void id() {
    listId.clear();
    listId.add(DropdownMenuItem(value: "EMN-001", child: Text("EMN-001")));
    listId.add(DropdownMenuItem(value: "EMN-002", child: Text("EMN-002")));
    listId.add(DropdownMenuItem(value: "EMN-003", child: Text("EMN-003")));
    listId.add(DropdownMenuItem(value: "EMN-004", child: Text("EMN-004")));
  }

  @override
  Widget build(BuildContext context) {
    id();

    // var center = Alignment.center;
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

      body: Center(
        child: Column(
          children: [
            Container(
              width: 300,
              height: 100,
              margin: EdgeInsets.only(top: 100),
              child: Text(
                "Numéro d'identification du PC",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
              ),
            ),

            Container(
              height: 70,
              width: double.infinity,
              // padding: EdgeInsets.all(),
              color: Colors.white,
              alignment: Alignment.center,
              child: DropdownButton(
                value: def,
                items: listId,
                hint: Text("Selectionner le numéro d'identification du PC"),
                onChanged: (value) {
                  def = value;
                  setState(() {});
                },
              ),
            ),

            SizedBox(
              width: 100,
              height: 100,
            ),

            Container(
              width: 150,
              height: 70,
              margin: EdgeInsets.only(left: 10),
              // alignment: Alignment.bottomRight,
              child:ElevatedButton.icon(
                onPressed: (){
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context)=> Recap(),
                    ),
                  );
                }, 

                icon: const Icon(Icons.arrow_forward),
                label: const Text(
                  "Suivant",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 76, 196, 202)
                  ),
                ),
                              
              ) ,
            ),
          ],
        ),
      ),
    );
  }
}
