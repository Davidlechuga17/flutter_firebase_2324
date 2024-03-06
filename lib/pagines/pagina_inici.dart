import 'package:flutter/material.dart';
import 'package:flutter_firebase_2324/auth/servei_auth.dart';

class PaginaInici extends StatelessWidget {
  const PaginaInici({super.key});

  void logout(){
    final serveiAuth = ServeiAuth();

    serveiAuth.tancarSessio();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pàgina inici"),
        actions: [
          IconButton(
            onPressed: logout, 
            icon: Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}