import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_2324/auth/servei_auth.dart';
import 'package:flutter_firebase_2324/pagines/editar_dades_usuari.dart';

class ItemUsuari extends StatelessWidget {

  final String emailUsuari;
  final String uid;
  final String? urlImatge;
  final void Function()? onTap;

   const ItemUsuari({
    super.key,
    required this.emailUsuari,
    required this.uid,
    required this.onTap,
    this.urlImatge,
  });
   

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 25,
        ),
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            mostrarImatgePerfil(),
              
            const SizedBox(width: 10),
            Text(emailUsuari),
          ]
        ),
      ),
    );
  }

  Widget mostrarImatgePerfil() {
  return FutureBuilder(
    future: getImatgePerfil(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Text("Carregant...");
      } else {
        if (snapshot.hasError || snapshot.data == null) {
          return const Icon(Icons.person); // Mostra la icona d'una persona si no hi ha imatge.
        } else {
          return CircleAvatar(
            backgroundImage: NetworkImage(snapshot.data!), // Mostra la imatge de perfil.
          );
        }
      }
    },
  );
}

Future<String?> getImatgePerfil() async {
  final String idUsuari = uid;
  final Reference ref = FirebaseStorage.instance.ref().child("$idUsuari/avatar/$idUsuari");

  try {
    // Intenta obtenir la URL de la imatge de perfil.
    final String urlImatge = await ref.getDownloadURL();
    return urlImatge;
  } catch (e) {
    // Si no es troba cap imatge de perfil, retorna null.
    return null;
  }
}

}