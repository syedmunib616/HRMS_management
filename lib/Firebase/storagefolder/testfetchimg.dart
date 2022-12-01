// ignore_for_file: unnecessary_null_comparison

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hrmanagementapp/Firebase/storagefolder/storageFolder.dart';

class FetchImage extends StatefulWidget {
  const FetchImage({Key? key}) : super(key: key);

  @override
  _FetchImageState createState() => _FetchImageState();
}

class _FetchImageState extends State<FetchImage> {

  late Future<List<FirebaseFile>> futureFiles;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureFiles= FirebaseApi. listAll('test/');
    futureFiles ==null ? null: print("guddi mandi main");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        futureFiles== null ? const Center(child: CircularProgressIndicator(),) : FutureBuilder<List<FirebaseFile>>(
         // FutureBuilder<List<FirebaseFile>>(
          future: futureFiles,
            builder: (context,snapshot){
            switch(snapshot.connectionState){
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator(),);
              default:
                if(snapshot.hasError) {
                  return const Center(child: Text("Some error occurred"),);
                }
                else {
                final files=snapshot.data!;
                  return Column(
                    children: [
                      //buildHeader(0),
                      const SizedBox(height: 12,),
                      Expanded(
                          child: ListView.builder(
                              itemCount: files.length,
                              itemBuilder: (context, index) {
                                final file =files[index];
                                  return buildFile(context,file);
                          },
                        ),
                      ),
                    ],
                  );
                }
              }
            },
          ),
        );
      }

  Widget buildFile(BuildContext context,FirebaseFile file) => Container(
    height: 100,
    width: 300,
    child: ListTile(
      title: Text(file.name,style: const TextStyle(fontWeight: FontWeight.bold,decoration: TextDecoration.underline,color: Colors.blue),),
    ),
  );


  Widget buildHeader(int lenght)=> ListTile(
    tileColor: Colors.blue,
    leading: Container(

    ),
  );
}
