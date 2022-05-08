import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:opp/widgets/firstChart.dart';

import '../widgets/charts.dart';
import '../widgets/pie_chart.dart';

class Stats extends StatefulWidget {
  const Stats({Key? key}) : super(key: key);

  @override
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  static CircularRectTween _createRectTween(Rect? begin, Rect? end) {
    return CircularRectTween(begin: begin!, end: end!);
  }

  @override
  Widget build(BuildContext context) {
    List<FirstChart> firstChart = [];
    List<PieChart> pieChart = [];
    return Material(
      color: Colors.black,
      child: Hero(
        tag: 'blackBox',
        createRectTween: _createRectTween,
        child: Scaffold(
          appBar: AppBar(title: Text('Stats',style: TextStyle(color: Colors.white),),backgroundColor: Colors.black,),
          body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance.collection('stats').limit(1).snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot){
              if (snapshot.hasError) {
                return const Center(child: Text('Something went wrong',style: TextStyle(color: Colors.white),),);
              }

              if (snapshot.connectionState == ConnectionState.active){
                if(snapshot.hasData){
                  if(snapshot.data!.docs.isNotEmpty){
                    Map<String,dynamic> data = snapshot.data!.docs[0].data() as Map<String,dynamic>;
                    print('data[years] =>>>>  ${data['years']}');
                    data['years'].forEach((key, value){
                      print('----->>  $key $value');
                      firstChart.add(FirstChart(maxPackage: data['years'][key]!,year: key));
                    });
                    data['placementCount'].forEach((key, value){
                      print('----->>  $key $value');
                      pieChart.add(PieChart(noOfPlacements: data['placementCount'][key]!,year: key));
                    });
                    //
                    // List<Map<String,int>> maxPlacementOffer = data['years'];
                    // List<Map<String,int>> totalPlacementsEachYear = data['placementCount'];
                    // List<Map<String,int>> appliedCount = data['appliedCount'];
                    return Charts(firstChart:firstChart,pieChart:pieChart);
                  }
                  else{
                    return const Center(child: Text('There is no data available!',style: TextStyle(color: Colors.white),),);
                  }
                }
                else{
                  return const Center(child: Text('There was some error in fetching the data!!',style: TextStyle(color: Colors.white),),);
                }
              }

              return const Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 12.0, right: 12.0),
                  child: LinearProgressIndicator(),
                ),
              );
            }
          ),
        )
      ),
    );

  }
}


class CircularRectTween extends RectTween {
  CircularRectTween({required Rect begin, required Rect end})
      : super(begin: begin, end: end) {}

  @override
  Rect lerp(double t) {
    final double? width = lerpDouble(begin!.width, end!.width, t);
    double startWidthCenter = begin!.left + (begin!.width / 2);
    double startHeightCenter = begin!.top + (begin!.height / 2);

    return Rect.fromCircle(center: Offset(startWidthCenter, startHeightCenter), radius: width! * 1.7);
  }
}