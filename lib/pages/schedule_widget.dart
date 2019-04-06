import 'package:flutter/material.dart';

class ScheduleWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Bookings"),
      ),   
      body: Container(
        child: DefaultTabController(
          length: 3,
          initialIndex: 0,  
          child: Column(
            children: [
              TabBar(
                labelColor: Colors.black,
                isScrollable: false,
                tabs: [
                  Tab(text: 'Upcoming'), 
                  Tab(text: 'Past'),
                  Tab(text: 'Canceled',)
                ],
              ),
              Container(
                height: 300.0, 
                child: TabBarView(
                  children: [
                    Center(child: Text('No upcoming bookings')),
                    Center(child: Text('No past bookings')),
                    Center(child: Text('No canceled bookings')),
                  ],
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}