import 'package:flutter/material.dart';

class MyTripsScreen extends StatefulWidget {
  @override
  _MyTripsScreenState createState() => _MyTripsScreenState();
}

class _MyTripsScreenState extends State<MyTripsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Trips'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Current Trips'),
            Tab(text: 'Next Trips'),
            Tab(text: 'Past Trips'),
            Tab(text: 'Wish List'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          buildTripTab(), // Current Trips Tab
          buildTripTab(), // Next Trips Tab
          buildTripTab(), // Past Trips Tab
          buildTripTab(), // Wish List Tab
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add trip action
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget buildTripTab() {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(10)),
                    child: Image.network(
                      'assets/Mask Group.png', // Replace with actual image URL
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: ElevatedButton(
                      onPressed: () {
                        // Mark as finished action
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white.withOpacity(0.7),
                      ),
                      child: Text('Mark Finished',
                          style: TextStyle(color: Colors.black)),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Container(
                      color: Colors.black54,
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      child: Text(
                        'Da Nang, Vietnam',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dragon Bridge Trip',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.calendar_today, size: 16),
                        SizedBox(width: 5),
                        Text('Jan 30, 2020'),
                        SizedBox(width: 20),
                        Icon(Icons.access_time, size: 16),
                        SizedBox(width: 5),
                        Text('13:00 - 15:00'),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              'assets/guide1.jpg'), // Replace with actual profile image URL
                          radius: 15,
                        ),
                        SizedBox(width: 10),
                        Text('Tuan Tran'),
                      ],
                    ),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to trip detail
                      },
                      child: Text('Detail'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
