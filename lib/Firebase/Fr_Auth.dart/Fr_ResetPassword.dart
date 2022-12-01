import 'package:firebase_auth/firebase_auth.dart';

class FrResetPassword {
  Future newPassword(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(
      email: email.trim(),
    );
  }
}
