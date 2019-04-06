import 'package:flutter/material.dart';
import '../model/pregnancy_tip.dart';

class PregnancyTipPage extends StatelessWidget {
  final PregnancyTip pregnancyTip;

  PregnancyTipPage(this.pregnancyTip);
  
  @override
  Widget build(BuildContext context) {

    final gymClassPrice = Container(
      padding: const EdgeInsets.all(7.0),
      decoration: new BoxDecoration(
          border: new Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(5.0)),
      // child: new Text(
      //   "SEK " + gymClass.price.toString(),
      //   style: TextStyle(color: Colors.white),
      // ),
    );

    final headerContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 60.0),
        // Icon(
        //   Icons.pregnant_woman,
        //   color: Colors.white,
        //   size: 40.0,
        // ),
        // Container(
        //   width: 90.0,
        //   child: new Divider(color: Colors.white),
        // ),
        // SizedBox(height: 20.0),
        // Text(
        //   pregnancyTip.name,
        //   style: TextStyle(color: Colors.white, fontSize: 35.0),
        // ),
        // SizedBox(height: 30.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // Expanded(flex: 5, child: Text("")),
            // Expanded(
            //     flex: 6,
            //     child: Padding(
            //         padding: EdgeInsets.only(left: 10.0),
            //         child: Text(
            //           lesson.level,
            //           style: TextStyle(color: Colors.white),
            //         ))),
            Expanded(flex: 0, child: gymClassPrice ),
          ],
        ),
      ],
    );

    final headerContent = Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/" + pregnancyTip.image),
              fit: BoxFit.cover,
            ),
          )
        ),
        // Container(
        //   height: MediaQuery.of(context).size.height * 0.4,
        //   padding: EdgeInsets.only(left: 40.0, right: 40.0),
        //   width: MediaQuery.of(context).size.width,
        //   decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .2)),
        //   child: Center(
        //     child: headerContentText,
        //   ),
        // ),
      ],
    );

    final bottomContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          pregnancyTip.name,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
        ),
        Text(
          pregnancyTip.source,
          style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.grey[600]),
          textAlign: TextAlign.start,
        ),
        Padding(
          padding: EdgeInsets.only(top:20),
          child:
            Text(
              pregnancyTip.content,
              style: TextStyle(fontSize: 14.0),
              textAlign: TextAlign.justify,
            ),
        ),
        // Text(
        //   "\nTime",
        //   style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        // ),
        // Text(
        //   gymClass.time + " (" + gymClass.duration.toString() + " mins)",
        //   style: TextStyle(fontSize: 18.0),
        // ),
      ],
    );

    final bottomContent = Container(
      // height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      // color: Theme.of(context).primaryColor,
      padding: EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          children: <Widget>[
            bottomContentText, 
          ],
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(pregnancyTip.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment:  CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            headerContent,
            bottomContent,
          ],
        ),
      ),
    );
  }
}

