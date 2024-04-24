import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_2324/auth/servei_auth.dart';
import 'package:flutter_firebase_2324/chat/servei_chat.dart';

class CambiarNom extends StatefulWidget {
   const CambiarNom({super.key});

  @override
  State<CambiarNom> createState() => _CambiarNomState();
}

class _CambiarNomState extends State<CambiarNom> {
final ServeiAuth _serveiAuth = ServeiAuth();
final TextEditingController _nomController = TextEditingController();

void logout(){
  _serveiAuth.tancarSessio();
}

@override
void initState(){
  super.initState();

  _obtenirNomUsuari();
}

Future<void> _obtenirNomUsuari() async{
  String? nomUsuari = await _serveiAuth.getNomUsuariActual();
  if(nomUsuari != null){
    setState(() {
      _nomController.text = nomUsuari;
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar dades"),
        backgroundColor: const Color.fromARGB(255, 180, 146, 204),
        actions: [
          IconButton(
            onPressed: logout, 
            icon: const Icon(Icons.logout),
          ),
        ]
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${_serveiAuth.getUsuariActual()!.email}", 
              style: const TextStyle(
                fontSize: 18
              ),
            ),

            const SizedBox(height: 20,),

            TextField(
              controller: _nomController,
              decoration: const InputDecoration(
                hintText: "Escriu el teu nom...",
              ),
            ),

            const SizedBox(height: 20,),

            ElevatedButton(
              onPressed: () {
                String nouNom = _nomController.text.trim();

                if(nouNom.isEmpty){
                  return;
                }

                _serveiAuth.actualitzarNomUsuari(nouNom);

                Navigator.pop(context);

              }, 
              child: const Text("Guardar"),
            ), 
          ],
        ),
      ),
    );
  }

 
}