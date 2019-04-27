import 'package:flutter/material.dart';

class PregnancyTipPage extends StatelessWidget {
  final dynamic pregnancyTip;

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

    final headerContent = Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(pregnancyTip['image_url']),
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
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          pregnancyTip['title'].toString(),
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
        ),
        Text(
          pregnancyTip['source'],
          style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.grey[600]),
          textAlign: TextAlign.start,
        ),
        Padding(
          padding: EdgeInsets.only(top:20),
          child:
            Text(
              pregnancyTip['content'],
              style: TextStyle(fontSize: 14.0),
              textAlign: TextAlign.start,
            ),
        ),
      ],
    );

    Card _advert() {
      return Card(
        child: Container(
          padding: EdgeInsets.only(top: 10, bottom:10),
          child: Image.network('https://raw.githubusercontent.com/samheyman/flutter-app/master/images/advert' + pregnancyTip['advert'].toString() + '.png'),
        ),
      );
    }

    final bottomContent = Container(
      // height: MediaQuery.of(context).size.height,
      //width: MediaQuery.of(context).size.width,
      // color: Theme.of(context).primaryColor,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10.0),
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
        title: Text(pregnancyTip['title']),
        actions: <Widget>[
          
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment:  CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            headerContent,
            bottomContent,
            _advert(),
          ],
        ),
      ),
    );
  }
}

