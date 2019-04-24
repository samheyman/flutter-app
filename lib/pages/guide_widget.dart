import 'package:flutter/material.dart';
import '../state_widget.dart';

class GuideWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double _icon_size = 24;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        elevation: 0,
        title: Text("Guide"),
      ),
      body: Container(
        padding: EdgeInsets.all(0),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _buildGuideEntry(Icon(Icons.pregnant_woman, size: _icon_size,), 'Exercise during pregnancy'),
            _buildGuideEntry(Icon(Icons.rowing, size: _icon_size,), 'Aerobic training'),
            _buildGuideEntry(Icon(Icons.fitness_center, size: _icon_size,), 'Strength training'),
            _buildGuideEntry(Icon(Icons.check, size: _icon_size,), 'Benefits'),
            _buildGuideEntry(Icon(Icons.warning, size: _icon_size,), 'Precautions'),
            _buildGuideEntry(Icon(Icons.timelapse, size: _icon_size,), 'How much exercise?'),
            _buildGuideEntry(Icon(Icons.people, size: _icon_size,), 'Benefits of classes'),
            _buildGuideEntry(Icon(Icons.child_friendly, size: _icon_size,), 'Exercise after pregnancy'),
            _buildGuideEntry(Icon(Icons.live_help, size: _icon_size,), 'FAQ'),

          ],
        ),
      ),
    ); 
  }
}

_buildGuideEntry (Icon icon, String entry) {
  return Container(
    height: 70,
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border(
        bottom: BorderSide(
          color: Colors.grey[400],
          width: 1,
        ),
      ),
    ),
    child: ListTile(
      leading: Container(
        padding: EdgeInsets.only(bottom: 30),
        height: 70,
        child: icon,
      ), 
      contentPadding: EdgeInsets.only(left:20),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(entry,
          style: TextStyle(fontSize: 16, color: Colors.grey[600])),
        Padding(padding: EdgeInsets.only(top:5),),
        ]
      ),
    ),
  );
}