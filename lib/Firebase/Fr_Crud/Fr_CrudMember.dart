import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hrmanagementapp/Model/DB_Models/Model_Member.dart';

class FrCrudMember {
  final String collectionPath = "Member";

  // Read Member
  Future createMember(ModelMember modelMember) async {
    final document = FirebaseFirestore.instance
        .collection(collectionPath)
        .doc(modelMember.membersId.toString());

    final json = modelMember.toJson();

    await document.set(json);
  }

  // Read Member
  Future<ModelMember?> readMember(String collectionID) async {
    final document =
        FirebaseFirestore.instance.collection(collectionPath).doc(collectionID);

    final snapshot = await document.get();
    if (snapshot.exists) {
      return ModelMember.fromJson(snapshot.data()!);
    }
    return null;
  }

  // Update Member
  Future<void> updateMember(
      String collectionID, ModelMember modelMember) async {
    final document =
        FirebaseFirestore.instance.collection(collectionPath).doc(collectionID);

    document.update(modelMember.toJson());
  }

  // Delete Member
  Future<void> deleteMember(String collectionID) async {
    final document =
        FirebaseFirestore.instance.collection(collectionPath).doc(collectionID);

    document.delete();
  }
}
