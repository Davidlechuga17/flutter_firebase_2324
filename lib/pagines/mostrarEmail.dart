import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_2324/auth/servei_auth.dart';
import 'package:flutter_firebase_2324/chat/servei_chat.dart';
import 'package:flutter_firebase_2324/pagines/pagina_editarDades.dart';

class mostrarEmail extends StatefulWidget {
   const mostrarEmail({super.key});

  @override
  State<mostrarEmail> createState() => _mostrarEmailState();
}

class _mostrarEmailState extends State<mostrarEmail> {
final ServeiAuth _serveiAuth = ServeiAuth();
final ServeiChat _serveiChat = ServeiChat();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _construeixNomUsuari(),
    );
  }

  Widget _construeixNomUsuari(){

    return StreamBuilder(
      stream: _serveiChat.getUsuaris(), 
      builder: (context, snapshot){

        // Mirar si hi ha error.
        if(snapshot.hasError){

          return const Text("Error");
        }

        //Esperem que es carreguin les dades.
        if(snapshot.connectionState == ConnectionState.waiting){
          
          return const Text("Carregant dades...");
        }

        //Es retornen les dades.
        return ListView(
          children: snapshot.data!.map<Widget>(
            (dadesUsuari) => mostra(dadesUsuari)
          ).toList(),
        );
      },
    );
  }

  Widget mostra(Map<String, dynamic> dadesUsuari){
    if (dadesUsuari["email"] == _serveiAuth.getUsuariActual()!.email) {
      
      return Container();
    }

    return PaginaEditarDades(
      emailUsuari: dadesUsuari["email"],
    );
  }
}