import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:flutter/material.dart';
import '../../state_widget.dart';
import '../../model/state.dart';

List<CircularStackEntry> data(ellapsed, left) {
  return <CircularStackEntry>[
    CircularStackEntry(
      <CircularSegmentEntry>[
        CircularSegmentEntry(
          ellapsed,
          Colors.redAccent,
          rankKey: 'completed',
        ),
        CircularSegmentEntry(
          left,
          Colors.blueGrey[100],
          rankKey: 'remaining',
        ),
      ],
      rankKey: 'progress',
    ),
  ];
}

class AnimatedPieChart extends StatefulWidget {
  final double ellapsedWeeks;
  final double remainingWeeks;

  AnimatedPieChart({this.ellapsedWeeks, this.remainingWeeks});

  @override
  _AnimatedPieChartState createState() =>
      _AnimatedPieChartState(ellapsedWeeks, remainingWeeks);
}

class _AnimatedPieChartState extends State<AnimatedPieChart> {
  _AnimatedPieChartState(ellapsedWeeks, remainingWeeks);

  final GlobalKey<AnimatedCircularChartState> _chartKey = GlobalKey<AnimatedCircularChartState>();
  final _chartSize = const Size(180, 180);
  int sampleIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AnimatedCircularChart(
      key: _chartKey,
      duration: Duration(seconds: 0),
      size: const Size(180, 180),
      initialChartData: data(widget.ellapsedWeeks, widget.remainingWeeks),
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