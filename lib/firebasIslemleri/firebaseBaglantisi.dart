import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// giriş
  Future<User?> singIn(String email, String password) async {
    var user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);

    return user.user;
  }

  // çıkış
  singOut() async {
    return _auth.signOut();
  }

  createPerson(String nameAndSurName, String adres, String email,
      String password) async {
    var user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    await _firestore.collection("person").doc(user.user?.uid).set({
      'email': email,
      'password': password,
      'NameAndSurname': nameAndSurName,
      'puan': 0,
      'adres': adres
    });
    return user.user;
  }
}
