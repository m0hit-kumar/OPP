import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PlacmentPage2 extends StatefulWidget {
  const PlacmentPage2({Key? key}) : super(key: key);

  @override
  State<PlacmentPage2> createState() => _PlacmentPage2State();
}

class _PlacmentPage2State extends State<PlacmentPage2> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder<QuerySnapshot>(
          stream: _usersStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }

            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                print("000000000000 $document");
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;

                print("000000000000 $data");
                return Container(
                  color: Colors.green,
                  child: ListTile(
                    title: Text(data['company']),
                    subtitle: Text(data['company']),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
