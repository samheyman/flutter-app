// import 'package:flutter_circular_chart/flutter_circular_chart.dart';
// import 'package:flutter/material.dart';


// List<CircularStackEntry> data = <CircularStackEntry>[
//   new CircularStackEntry(
//     <CircularSegmentEntry>[
//       new CircularSegmentEntry(500.0, Colors.red[200], rankKey: 'Q1'),
//       new CircularSegmentEntry(1000.0, Colors.green[200], rankKey: 'Q2'),
//       new CircularSegmentEntry(2000.0, Colors.blue[200], rankKey: 'Q3'),
//       new CircularSegmentEntry(1000.0, Colors.yellow[200], rankKey: 'Q4'),
//     ],
//     rankKey: 'Quarterly Profits',
//   ),
// ];

// class AnimatedPieChart extends StatefulWidget {
//   @override
//   _AnimatedPieChartState createState() =>
//       _AnimatedPieChartState();
// }

// class _AnimatedPieChartState extends State<AnimatedPieChart> {
//   final GlobalKey<AnimatedCircularChartState> _chartKey = new GlobalKey<AnimatedCircularChartState>();
//   final _chartSize = const Size(300.0, 300.0);
//   int sampleIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedCircularChart(
//       key: _chartKey,
//       size: const Size(300.0, 300.0),
//       initialChartData: data,
//       chartType: CircularChartType.Pie,
//     );
//   }
// }

import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:flutter/material.dart';


List<CircularStackEntry> data = <CircularStackEntry>[
  CircularStackEntry(
    <CircularSegmentEntry>[
      CircularSegmentEntry(
        15,
        Colors.redAccent,
        rankKey: 'completed',
      ),
      CircularSegmentEntry(
        25,
        Colors.blueGrey[100],
        rankKey: 'remaining',
      ),
    ],
    rankKey: 'progress',
  ),
];

class AnimatedPieChart extends StatefulWidget {
  @override
  _AnimatedPieChartState createState() =>
      _AnimatedPieChartState();
}

class _AnimatedPieChartState extends State<AnimatedPieChart> {
  final GlobalKey<AnimatedCircularChartState> _chartKey = new GlobalKey<AnimatedCircularChartState>();
  final _chartSize = const Size(180, 180);
  int sampleIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AnimatedCircularChart(
      key: _chartKey,
      duration: Duration(seconds: 0),
      size: const Size(180, 180),
      initialChartData: data,
      chartType: CircularChartType.Radial,
      // holeLabel: "   15\nweeks",
      holeRadius: 65,
      labelStyle: TextStyle(
        color: Colors.redAccent,
        fontWeight: FontWeight.bold,
        fontSize: 18.0,
      ),
    );
  }
}