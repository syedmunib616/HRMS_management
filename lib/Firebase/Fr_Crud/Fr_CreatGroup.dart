import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hrmanagementapp/Model/DB_Models/Model_GroupT.dart';

class FrCreatGroup {
  final String collectionPath = "GroupT";

  // Create GroupT
  Future createGroup(ModelGroupT modelGroupT) async {
    final document = FirebaseFirestore.instance
        .collection(collectionPath)
        .doc(modelGroupT.groupId.toString());

    final json = modelGroupT.toJson();

    await document.set(json);
  }

  // Read GroupT
  Future<ModelGroupT?> readGroupT(String collectionID) async {
    final document =
        FirebaseFirestore.instance.collection(collectionPath).doc(collectionID);

    final snapshot = await document.get();
    if (snapshot.exists) {
      return ModelGroupT.fromJson(snapshot.data()!);
    }
    return null;
  }

  // Update GroupT
  Future<void> updateGroupT(
      String collectionID, ModelGroupT modelGroupT) async {
    final document =
        FirebaseFirestore.instance.collection(collectionPath).doc(collectionID);

    document.update(modelGroupT.toJson());
  }

  // Delete GroupT
  Future<void> deleteGroupT(String collectionID) async {
    final document =
        FirebaseFirestore.instance.collection(collectionPath).doc(collectionID);

    document.delete();
  }
}
