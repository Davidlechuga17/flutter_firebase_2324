import 'package:flutter/material.dart';
import 'package:flutter_firebase_2324/pagines/pagina_login.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PaginaLogin(),
    );
  }
}


/*
1) Tenir el Node.js instal·lat.
2) npm install -g firebase-tools
3) Fer login a Firebase: firebase login
  -Si dona error de l'arxiu firebase.ps1, canviar-li el nom (o esborrar-lo i tornar a fer login).
  -Si tornem a fer firebase login, ens diu en quin compte estem.
  -Si vulguessim canviar el compte, fem firebase logout.
*/