import 'package:flutter/material.dart';

class CompanyInfo extends StatefulWidget {
  const CompanyInfo({Key? key, required this.data, required this.index})
      : super(key: key);
  final Map<String, dynamic> data;
  final int index;
  @override
  _CompanyInfoState createState() => _CompanyInfoState();
}

class _CompanyInfoState extends State<CompanyInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            iconTheme: const IconThemeData(color: Colors.black),
            elevation: 3.0,
            forceElevated: true,
            expandedHeight: 200.0,
            backgroundColor: Colors.white,
            // backgroundColor: Colors.deepPurple,
            // 4
            flexibleSpace: FlexibleSpaceBar(
              // title: Text(widget.data['company']),
              background: Hero(
                  tag: widget.index.toString(),
                  child: widget.index == 0
                      ? Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Image.asset(
                            'assets/images/lg.png',
                            fit: BoxFit.fitWidth,
                          ),
                        )
                      : Image.asset(
                          'assets/images/googlr.png',
                          fit: BoxFit.fitWidth,
                        )),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(
                top: 11.0, left: 10.0, right: 10.0, bottom: 2.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  Center(
                    child: Text(
                      widget.data['company'],
                      style: const TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        'Offering Package: ${widget.data['pakage'].toString()} INR',
                        style: const TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w200),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const Text(
                    'Job Titles',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300),
                  ),
                  Container(
                    height: 2.0,
                    color: Colors.black,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: Colors.black,
                          ),
                          Text('Data Analyst')
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: Colors.black,
                          ),
                          Text('Cloud Expert')
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  ElevatedButton(
                      onPressed: () {

                      },
                      style: const ButtonStyle(
                          // backgroundColor: MaterialStateProperty(),
                          ),
                      child: const Text(
                        'Apply',
                        style: TextStyle(
                            fontWeight: FontWeight.w200, color: Colors.white),
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
