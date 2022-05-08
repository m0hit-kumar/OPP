import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:opp/pages/company_detail.dart';

class PlacmentPage2 extends StatefulWidget {
  const PlacmentPage2({Key? key}) : super(key: key);

  @override
  State<PlacmentPage2> createState() => _PlacmentPage2State();
}

class _PlacmentPage2State extends State<PlacmentPage2> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('offers').snapshots();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.deepPurpleAccent,title: const Text('Current Placement Offers',)),
        body: StreamBuilder<QuerySnapshot>(
          stream: _usersStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Center(child: Text('Something went wrong'));
            }

            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                if (snapshot.data!.docs.isNotEmpty) {
                  return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> data = snapshot.data!.docs[index]
                            .data() as Map<String, dynamic>;
                        // print("000000000000 ${document}");
                        // Map<String, dynamic> data =
                        // document.data()! as Map<String, dynamic>;

                        print("000000000000 $data");
                        return Card(
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
                          shadowColor: Colors.grey,
                          elevation: 4.0,
                          child: ListTile(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (_) => CompanyInfo(index: index,data: data)
                              ));
                            },
                            leading: Hero(
                                tag: index.toString(),
                                child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: index == 0?Image.asset(
                                  'assets/images/lg.png',
                                  fit: BoxFit.cover,
                                ):Image.asset(
                                  'assets/images/googlr.png',
                                  fit: BoxFit.fitWidth,
                                ),)),
                            title: Text(data['company']),
                            subtitle: const Text('Product Based'),
                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
                            trailing: const Icon(Icons.arrow_forward),
                            // color: Colors.green,
                            // child: ListTile(
                            //   title: Text(data['company']),
                            //   subtitle: Text(data['company']),
                            // ),
                          ),
                        );
                      });
                } else {
                  return const Center(
                      child: Text('Currently there is no data available'));
                }
              } else {
                return const Center(
                    child: Text('There was some error in fetching the data'));
              }
            }

            return const Center(
              child: Padding(
                padding: EdgeInsets.only(left: 12.0, right: 12.0),
                child: LinearProgressIndicator(),
              ),
            );
          },
        ),
      ),
    );
  }
}
