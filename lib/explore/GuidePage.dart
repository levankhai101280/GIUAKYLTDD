import 'package:flutter/material.dart';

class GuideProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Image.network(
                  'assets/guidepage1.jpg',
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  left: 16,
                  top: 130,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/guide1.jpg'),
                  ),
                ),
                Positioned(
                  left: 300,
                  top: 210,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TripInformationScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                    child: Text('CHOOSE THIS GUIDE'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tuan Tran',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      SizedBox(width: 4),
                      Text('4.8'),
                      Text(' • 127 Reviews'),
                    ],
                  ),
                  SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: [
                      Chip(label: Text('Vietnamese')),
                      Chip(label: Text('English')),
                      Chip(label: Text('Korean')),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.grey),
                      Text('Danang, Vietnam'),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Short introduction: Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Container(
                    height: 180,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('assets/guide_video.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Icon(Icons.play_circle_fill,
                          color: Colors.white, size: 64),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Pricing',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Table(
                    border: TableBorder.all(color: Colors.grey),
                    children: [
                      TableRow(children: [
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Center(child: Text('1 - 3 Travelers')),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Center(child: Text('\$10/hour')),
                        ),
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Center(child: Text('4 - 6 Travelers')),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Center(child: Text('\$14/hour')),
                        ),
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Center(child: Text('7 - 9 Travelers')),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Center(child: Text('\$17/hour')),
                        ),
                      ]),
                    ],
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TripInformationScreen extends StatefulWidget {
  @override
  _TripInformationScreenState createState() => _TripInformationScreenState();
}

class _TripInformationScreenState extends State<TripInformationScreen> {
  DateTime? selectedDate;
  int numberOfTravelers = 1;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Trip Information', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Date',
                hintText: 'mm/dd/yy',
                prefixIcon: Icon(Icons.calendar_today),
                border: UnderlineInputBorder(),
              ),
              onTap: () => _selectDate(context),
            ),
            // (Remaining fields go here)
          ],
        ),
      ),
    );
  }
}
