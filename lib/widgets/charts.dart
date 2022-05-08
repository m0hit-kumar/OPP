import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:opp/widgets/pie_chart.dart';
import 'firstChart.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Charts extends StatefulWidget {
  const Charts({Key? key, required this.firstChart, required this.pieChart})
      : super(key: key);

  final List<FirstChart> firstChart;
  final List<PieChart> pieChart;
  @override
  _ChartsState createState() => _ChartsState();
}

class _ChartsState extends State<Charts> {
  @override
  Widget build(BuildContext context) {
    List<charts.Series<FirstChart, String>> barSeries = [
      charts.Series(
        id: "bar",
        data: widget.firstChart,
        domainFn: (FirstChart series, _) => series.year,
        measureFn: (FirstChart series, _) => series.maxPackage,
        colorFn: (FirstChart series, _) =>
            charts.ColorUtil.fromDartColor(Colors.deepPurpleAccent),
        // areaColorFn:(FirstChart series, _) => charts.ColorUtil.fromDartColor(Colors.deepPurpleAccent)
      )
    ];

    List<charts.Series<PieChart, String>> pieSeries = [
      charts.Series(
        id: "pie",
        data: widget.pieChart,
        domainFn: (PieChart series, _) => series.year,
        measureFn: (PieChart series, _) => series.noOfPlacements,
        colorFn: (PieChart series, _) =>
            charts.ColorUtil.fromDartColor(Colors.deepPurpleAccent),
        labelAccessorFn: (PieChart series, _) =>
            '${series.year}(${series.noOfPlacements})',
      )
    ];
    return SingleChildScrollView(
      child: Column(
        children: [
          StreamBuilder<QuerySnapshot<Map<String,dynamic>>>(
            stream: FirebaseFirestore.instance.collection('stats').limit(1).snapshots(),
            builder: (context, snapshot) {
              if(snapshot.hasData){
                Map<String,dynamic> data = snapshot.data!.docs[0].data() as Map<String,dynamic>;
                double applied = double.parse(data['appliedCount'].toString());
                return Card(
                  color: Colors.red[100],
                  child: Column(
                    children: [
                      SfLinearGauge(
                        markerPointers: [
                          LinearWidgetPointer(
                            value: applied,
                            offset: 28,
                            position: LinearElementPosition.inside,
                            child: Image.asset('assets/images/success4.jpg',height: 20.0,width: 20.0,),
                          )
                        ],
                      ),
                      Align(child: Padding(
                        padding: const EdgeInsets.only(top: 3.0,left: 10.0),
                        child: RichText(text: TextSpan(
                          children: [
                           TextSpan(text: '${applied.toInt()} ',style: const TextStyle(fontWeight: FontWeight.w600,color: Colors.black)),
                           const TextSpan(text: 'students have already applied in this session!!',style: TextStyle(color: Colors.black)),
                          ]
                          )
                        ),
                      ),alignment: Alignment.centerLeft,)
                    ],
                  ),
                );
              }
              return Container();
            }
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Maximum Placement Packages',
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0),
            ),
          ),
          Card(
              margin: const EdgeInsets.all(8.0),
              elevation: 2.0,
              child: SizedBox(
                  height: 250,
                  child: charts.BarChart(barSeries, animate: true))),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'No. of Success Stories',
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0),
            ),
          ),
          Card(
              margin: const EdgeInsets.all(8.0),
              elevation: 2.0,
              child: SizedBox(
                height: 250,
                child: charts.PieChart<String>(pieSeries,
                    animate: true,
                    defaultRenderer: charts.ArcRendererConfig(
                        arcRendererDecorators: [
                          charts.ArcLabelDecorator(
                              labelPosition: charts.ArcLabelPosition.auto)
                        ])),
              )),
        ],
      ),
    );
  }
}
