import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetNumber extends StatelessWidget {
  final String documentId;

  const GetNumber({super.key, required this.documentId});
  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection(("Counter Number"));
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text("number: ${data['total']}");
        }
        return const Text("loading...");
      }),
    );
  }
}
