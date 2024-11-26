import 'package:flutter/material.dart';

class User {
  final String name;
  final String email;
  final String profileImageUrl;

  User({
    required this.name,
    required this.email,
    required this.profileImageUrl,
  });
}

class ProfileScreen extends StatelessWidget {
  final User user;

  ProfileScreen({required this.user}); // Nhận đối tượng user từ constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile section
              Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage:
                        NetworkImage(user.profileImageUrl), // Dùng ảnh từ user
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.name,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        user.email,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30),

              // My Photos section
              SectionHeader(title: "My Photos"),
              SizedBox(height: 10),
              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    PhotoTile(imageUrl: 'assets/journey1.jpg'),
                    PhotoTile(imageUrl: 'assets/anh2.jpg'),
                    PhotoTile(imageUrl: 'assets/journey1.jpg'),
                    PhotoTile(imageUrl: 'assets/anh2.jpg'),
                  ],
                ),
              ),
              SizedBox(height: 30),

              // My Journeys section
              SectionHeader(title: "My Journeys"),
              SizedBox(height: 10),
              JourneyCard(
                title: "A memory in Danang",
                location: "Danang, Vietnam",
                date: "Jan 20, 2020",
                imageUrl: 'assets/anh2.png',
                likes: 234,
              ),
              SizedBox(height: 16),
              JourneyCard(
                title: "Sapa in spring",
                location: "Sapa, Vietnam",
                date: "Jan 20, 2020",
                imageUrl: 'assets/anh2.png',
                likes: 234,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      ],
    );
  }
}

class PhotoTile extends StatelessWidget {
  final String imageUrl;

  const PhotoTile({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          imageUrl,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class JourneyCard extends StatelessWidget {
  final String title;
  final String location;
  final String date;
  final String imageUrl;
  final int likes;

  const JourneyCard({
    required this.title,
    required this.location,
    required this.date,
    required this.imageUrl,
    required this.likes,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.network(
              imageUrl,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.location_on, size: 16, color: Colors.grey),
                    SizedBox(width: 4),
                    Text(location, style: TextStyle(color: Colors.grey)),
                  ],
                ),
                SizedBox(height: 4),
                Text(date, style: TextStyle(color: Colors.grey)),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.favorite, color: Colors.red, size: 16),
                        SizedBox(width: 4),
                        Text('$likes Likes',
                            style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                    Icon(Icons.more_vert, color: Colors.grey),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
