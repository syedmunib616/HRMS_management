import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hrmanagementapp/Model/DB_Models/Model_UserT.dart';

class FrCrudUserT {

  final String collectionPath = "UserT";

  // Create User
  Future createUserT(ModelUserT modelUserT) async {
    final document = FirebaseFirestore.instance
        .collection(collectionPath)
        .doc(modelUserT.userTId.toString());

    final json = modelUserT.toJson();

    await document.set(json);
  }

  // Read User
  Future<ModelUserT?> readUserT(String collectionID) async {
    final document =
        FirebaseFirestore.instance.collection(collectionPath).doc(collectionID);

    final snapshot = await document.get();
    if (snapshot.exists) {
      return ModelUserT.fromJson(snapshot.data()!);
    }
    return null;
  }

  // Update User
  Future<void> updateUserT(String collectionID, ModelUserT modelUserT) async {
    final document =
        FirebaseFirestore.instance.collection(collectionPath).doc(collectionID);

    document.update(modelUserT.toJson());
  }

  // Delete User
  Future<void> deleteUserT(String collectionID) async {
    final document =
        FirebaseFirestore.instance.collection(collectionPath).doc(collectionID);

    document.delete();
  }

}

