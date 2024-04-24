import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ServeiAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fer login
  Future<UserCredential> loginAmbEmailIPassword(String email, password) async {
    try {
      UserCredential credencialUsuari = await _auth.signInWithEmailAndPassword(
        email: email, 
        password: password,
      );

      _firestore.collection("Usuaris").doc(credencialUsuari.user!.uid).set({
        "uid": credencialUsuari.user!.uid,
        "email": email,
      });

      return credencialUsuari;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //fer registre
  Future<UserCredential> registreAmbEmailIPassword(
      String email, password) async {
    try {
      UserCredential credencialUsuari = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      _firestore.collection("Usuaris").doc(credencialUsuari.user!.uid).set({
        "uid": credencialUsuari.user!.uid,
        "email": email,
      });

      return credencialUsuari;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //fer logout
  Future<void> tancarSessio() async {
    return await _auth.signOut();
  }

  User? getUsuariActual() {
    return _auth.currentUser;
  }

  Future<String?> getNomUsuariActual() async {
    String? uid = _auth.currentUser?.uid;
    if (uid != null) {
      DocumentSnapshot snapshot =
          await _firestore.collection('Usuaris').doc(uid).get();
      if (snapshot.exists) {
        Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;

        if (data != null && data.containsKey('nom')) {
          return data['nom'] as String?;
        } else {
          return null; // El campo 'nom' no está presente en el documento
        }
      } else {
        return null; // El documento no existe
      }
    }
    return null; // No se ha iniciado sesión o no hay un usuario actual
  }

  Future<void>actualitzarNomUsuari(String nouNom) async{
    String? uid = _auth.currentUser?.uid;
    if(uid != null){
      await _firestore.collection('Usuaris').doc(uid).update({'nom': nouNom});
    }
  }

  Future<String?>obtenirNomUsuariPerId(String idUsuari) async{
    try{
      DocumentSnapshot userSnapshot = await _firestore.collection('Usuaris').doc(idUsuari).get();
      if(userSnapshot.exists){
        Map<String, dynamic>? userData = userSnapshot.data() as Map<String, dynamic>?;

        if(userData != null && userData.containsKey('nom')){
          return userData['nom'] as String?;
        } else {
          return null;
        }
      }else{
        return null;
      }
    }catch (e){
      print('Error al obtener el nombre del usuario: $e');
      return null;
    }
  }

}
