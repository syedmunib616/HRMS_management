import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hrmanagementapp/Model/DB_Models/Model_Contact.dart';

class FrCrudContact {
  final String collectionPath = "Contact";

  // Create Contact
  Future createContact(ModelContact modelContact) async {
    final document = FirebaseFirestore.instance
        .collection(collectionPath)
        .doc(modelContact.contactId.toString());

    final json = modelContact.toJson();

    await document.set(json);
  }

  // Read Contact
  Future<ModelContact?> readContact(String collectionID) async {
    final document =
        FirebaseFirestore.instance.collection(collectionPath).doc(collectionID);

    final snapshot = await document.get();
    if (snapshot.exists) {
      return ModelContact.fromJson(snapshot.data()!);
    }
    return null;
  }

  // Update Contact
  Future<void> updateContact(
      String collectionID, ModelContact modelContact) async {
    final document =
        FirebaseFirestore.instance.collection(collectionPath).doc(collectionID);

    document.update(modelContact.toJson());
  }

  // Delete Contact
  Future<void> deleteContact(String collectionID) async {
    final document =
        FirebaseFirestore.instance.collection(collectionPath).doc(collectionID);
        document.delete();
  }
}
