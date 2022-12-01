// // ignore_for_file: avoid_print
//
// import 'package:email_auth/email_auth.dart';
//
//
//
// class FrEmailOTP {
//
//   Future<bool> sendOtp(String email) async {
//     EmailAuth(sessionName: 'Email Verification');
//
//     bool result = await EmailAuth(
//       sessionName: 'Email Verification',
//     ).sendOtp(
//       recipientMail: email,
//       otpLength: 5,
//     );
//     if (result) {
//       print("OTP Sent");
//     } else {
//       print("We could not sent the OTP");
//     }
//
//     return result;
//   }
//
//   Future<bool> virifyOtp(String email, String otpCode) async {
//     bool result = EmailAuth(
//       sessionName: 'Email Verification',
//     ).validateOtp(
//       recipientMail: email,
//       userOtp: otpCode,
//     );
//
//     if (result) {
//       print("OTP Verified");
//     } else {
//       print("Invalid OTP");
//     }
//     return result;
//   }
//
// }