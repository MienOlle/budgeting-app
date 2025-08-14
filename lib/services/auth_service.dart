import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var logger = Logger();

  Future<User> signUpWithEmailAndPassword(String email, String password) async {
    final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
     );
    
    return userCredential.user!;
  }
}