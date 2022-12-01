import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hrmanagementapp/Firebase/Fr_Crud/model/Model_Link.dart';


class FrCrudLink {
  final String collectionPath = "Link";

  // Create Links
  Future createLink(ModelLink modelLinks) async {
    final document = FirebaseFirestore.instance
        .collection(collectionPath)
        .doc(modelLinks.linkId.toString());

    final json = modelLinks.toJson();

    await document.set(json);
  }

  // Read Links
  Future<ModelLink?> readLink(String collectionID) async {
    final document =
        FirebaseFirestore.instance.collection(collectionPath).doc(collectionID);

    final snapshot = await document.get();
    if (snapshot.exists) {
      return ModelLink.fromJson(snapshot.data()!);
    }
    return null;
  }

  // Update Links
  Future<void> updateLink(String collectionID, ModelLink modelLinks) async {
    final document =
        FirebaseFirestore.instance.collection(collectionPath).doc(collectionID);

    document.update(modelLinks.toJson());
  }

  // Delete Links
  Future<void> deleteLink(String collectionID) async {
    final document =
        FirebaseFirestore.instance.collection(collectionPath).doc(collectionID);

    document.delete();
  }
}
