import 'package:flutter/material.dart';
import '../model/gym_class.dart';

class GymClassDetails extends StatelessWidget {
  final GymClass gymClass;

  GymClassDetails(this.gymClass);
  
  @override
  Widget build(BuildContext context) {

    final gymClassPrice = Container(
      padding: const EdgeInsets.all(7.0),
      decoration: new BoxDecoration(
          border: new Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(5.0)),
      child: new Text(
        "SEK " + gymClass.price.toString(),
        style: TextStyle(color: Colors.white),
      ),
    );

    final headerContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 60.0),
        Icon(
          Icons.pregnant_woman,
          color: Colors.white,
          size: 40.0,
        ),
        Container(
          width: 90.0,
          child: new Divider(color: Colors.white),
        ),
        SizedBox(height: 20.0),
        Text(
          gymClass.name,
          style: TextStyle(color: Colors.white, fontSize: 35.0),
        ),
        SizedBox(height: 30.0),
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
              image: AssetImage("images/yoga.jpg"),
              fit: BoxFit.cover,
            ),
          )
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          padding: EdgeInsets.only(left: 40.0, right: 40.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .7)),
          child: Center(
            child: headerContentText,
          ),
        ),
      ],
    );

    final bottomContentText = Column(
      children: [
        Text(
          "Location",
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        Text(
          gymClass.location,
          style: TextStyle(fontSize: 18.0),
        ),
        Text(
          "\nDate",
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        Text(
          gymClass.dateTime.toString(),
          style: TextStyle(fontSize: 18.0),
        ),
        Text(
          "\nTime",
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        Text(
          gymClass.dateTime.toString() + " (" + gymClass.duration.toString() + " mins)",
          style: TextStyle(fontSize: 18.0),
        ),
      ],
    );

    final bookButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        onPressed: () => {},
        color: Theme. of(context).primaryColor,
        child:
            Text("BOOK THIS CLASS", style: TextStyle(color: Colors.white)),
      ));

    final spacesLeft = Column(
      children: <Widget>[
        Text("(" + gymClass.places.toString() + " places left)")
      ],
    );

    final bottomContent = Container(
      // height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      // color: Theme.of(context).primaryColor,
      padding: EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          children: <Widget>[bottomContentText, bookButton, spacesLeft],
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(gymClass.name),
      ),
      body: Column(
        crossAxisAlignment:  CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          headerContent,
          bottomContent,
        ],
      ),
    );
  }
}

