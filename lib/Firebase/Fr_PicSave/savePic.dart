
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class Storage{

  final firebase_storage.FirebaseStorage storage=firebase_storage.FirebaseStorage.instance;

  Future<void> uploadFile(String filePath,String fileName) async {
    File file =File(filePath);
    try{
      await storage.ref('test/$fileName').putFile(file);
    } on firebase_core.FirebaseException catch (e) {
        print(e);
    }
  }

  Future<firebase_storage.ListResult> listfiles() async {
    firebase_storage.ListResult result = await storage.ref('test').listAll();
    result.items.forEach((firebase_storage.Reference ref) {
      print('found file: $ref');
    });
    return result;
  }

  Future<String> downloadURL(String imageName) async{
    String downloadURL =await storage.ref('test/$imageName').getDownloadURL();
    return downloadURL;
  }
  // Future saveinfouser(FirebaseUser) async{
  //   FirebaseFirestore.instance.collection("UserT").document(fUser.uid).setData({});
  // }

}