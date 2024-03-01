import 'package:flutter/material.dart';
import 'package:flutter_firebase_2324/pagines/pagina_login.dart';
import 'package:flutter_firebase_2324/pagines/pagina_registre.dart';

class LoginORegistre extends StatefulWidget {
  const LoginORegistre({super.key});

  @override
  State<LoginORegistre> createState() => _LoginORegistreState();
}

class _LoginORegistreState extends State<LoginORegistre> {

  bool mostrarPaginaLogin = true;

  void intercanviaPaginesLoginRegistre(){
    setState(() {
      mostrarPaginaLogin = !mostrarPaginaLogin;
    });
  }

  @override
  Widget build(BuildContext context) {

    if(mostrarPaginaLogin) {
      return PaginaLogin(alFerClic: intercanviaPaginesLoginRegistre,);
    }else{
      return PaginaRegistre(alFerClic: intercanviaPaginesLoginRegistre,);
    }

    
  }
}