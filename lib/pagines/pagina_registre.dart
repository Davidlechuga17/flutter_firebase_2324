import 'package:flutter/material.dart';
import 'package:flutter_firebase_2324/components/boto_auth.dart';
import 'package:flutter_firebase_2324/components/textfield_auth.dart';

class PaginaRegistre extends StatefulWidget {
  const PaginaRegistre({super.key});

  @override
  State<PaginaRegistre> createState() => _PaginaRegistreState();
}

class _PaginaRegistreState extends State<PaginaRegistre> {

  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final TextEditingController controllerConfirmarPassword = TextEditingController();


  void ferRegistre(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 183, 159),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  const Icon(
                    Icons.fireplace,
                    size: 120,
                    color: Color.fromARGB(255, 255, 240, 218),
                  ),
            
                  const SizedBox(height: 25,),
              
                  const Text(
                    "Crea un compte nou",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 240, 218),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            
                  const SizedBox(height: 25,),
              
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25,),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Color.fromARGB(255, 255, 240, 218),
                          ),
                        ),
                    
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4,),
                          child: Text(
                            "Registra't",
                            style: TextStyle(color: Color.fromARGB(255, 255, 240, 218),),
                          ),
                        ),
                    
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Color.fromARGB(255, 255, 240, 218),
                          ),
                        ),
                      ],
                    ),
                  ),
            
                  const SizedBox(height: 10,),
                    
                  TextFieldAuth(
                    controller: controllerEmail, 
                    obscureText: false, 
                    hintText: "Email",
                  ),
            
                  const SizedBox(height: 10,),
            
                  TextFieldAuth(
                    controller: controllerPassword, 
                    obscureText: true, 
                    hintText: "Password",
                  ),
            
                  const SizedBox(height: 10,),
            
                   Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text("Ja ets membre?"),
            
                        const SizedBox(width: 5,),
            
                        GestureDetector(
                          onTap: () {},
                          child: const Text("Fes login",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
            
                  const SizedBox(height: 10,),
            
                  BotoAuth(
                    text: "Registra't",
                    onTap: ferRegistre,
                  ),
            
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}