import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_2324/auth/servei_auth.dart';

class PaginaEditarDades extends StatelessWidget {
  final String emailUsuari;

   const PaginaEditarDades({
    super.key,
    required this.emailUsuari,
  });

  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          Text(emailUsuari),
        ],
      );
  }
}