import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PlacementPage extends StatefulWidget {
  const PlacementPage({Key? key}) : super(key: key);

  @override
  State<PlacementPage> createState() => _PlacementPageState();
}

class _PlacementPageState extends State<PlacementPage> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('offers')
      .where('package', isGreaterThan: 0)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          }

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Text(
                    "Profile",
                    style: TextStyle(
                        color: Color(0xFF130A33),
                        fontSize: 16,
                        fontWeight: FontWeight.w800),
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFf5f5f8),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.filter_alt_rounded,
                        size: 20,
                        color: Colors.black,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ]),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Container(
              //     width: double.infinity,
              //     height: 200,
              //     decoration: BoxDecoration(
              //       color: const Color(0xFF5456F8),
              //       borderRadius: BorderRadius.circular(10.0),
              //     ),
              //     child: Stack(children: [
              //       const Positioned(
              //         top: 30,
              //         left: 30,
              //         child: CircleAvatar(
              //           backgroundColor: Color(0xFFFF8C62),
              //           radius: 20,
              //         ),
              //       ),
              //       const Positioned(
              //         top: -30,
              //         right: -30,
              //         child: CircleAvatar(
              //           backgroundColor: Color(0xFF64C4D0),
              //           radius: 70,
              //           child: CircleAvatar(
              //             backgroundColor: Color(0xFF5456F8),
              //             radius: 50,
              //           ),
              //         ),
              //       ),
              //       const Positioned(
              //         bottom: -80,
              //         left: -50,
              //         child: CircleAvatar(
              //           backgroundColor: Color(0xFF64C4D0),
              //           radius: 80,
              //         ),
              //       ),
              //       const Positioned(
              //         top: 60,
              //         left: 70,
              //         child: Text(
              //           "Start Practing your Coding \nSkills on Leetcode",
              //           style: TextStyle(
              //               color: Colors.white, fontWeight: FontWeight.w700),
              //         ),
              //       ),
              //       Positioned(
              //         top: 10,
              //         right: -20,
              //         child:
              //             Image.asset("assets/images/practicing_graphics.png"),
              //       ),
              //     ]),
              //   ),
              // ),

              Expanded(
                flex: 1,
                child: ListView(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                    return Card(
                        child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            "assets/images/google.jpg",
                            width: 100,
                            height: 100,
                          ),
                        )
                      ],
                    ));
                    //  ListTile(
                    //   title: Text(data['company']),
                    //   subtitle: Text("${data['job_title']}"),
                    // );
                  }).toList(),
                ),
              ),
            ],
          );
        },
      )),
    );
  }
}
