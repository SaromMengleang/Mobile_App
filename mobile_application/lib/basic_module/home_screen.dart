import 'package:flutter/material.dart';

class InstagramHomePage extends StatelessWidget {
  const InstagramHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fuck You',
          style: TextStyle(
            fontFamily: 'Billabong',
            fontSize: 32,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          Icon(Icons.favorite_border, color: Colors.black),
          SizedBox(width: 16),
          Icon(Icons.messenger_outline, color: Colors.black),
          SizedBox(width: 12),
        ],
      ),
      body: Column(
        children: [
          // Stories
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              padding: EdgeInsets.symmetric(horizontal: 8),
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage:
                      NetworkImage('https://i.pravatar.cc/150?img=$index'),
                    ),
                    SizedBox(height: 4),
                    Text('User$index',
                        style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
            ),
          ),
          Divider(),
          // Feed
          Expanded(
            child: ListView.builder(
              itemCount: 50,
              itemBuilder: (context, index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Post header
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                      NetworkImage('https://i.pravatar.cc/150?img=$index'),
                    ),
                    title: Text('User$index'),
                    trailing: Icon(Icons.more_vert),
                  ),
                  // Post image
                  Image.network(
                    'https://picsum.photos/id/${index + 30}/400/300',
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                  // Action icons
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Icon(Icons.favorite_border),
                        SizedBox(width: 16),
                        Icon(Icons.comment_outlined),
                        SizedBox(width: 16),
                        Icon(Icons.send),
                        Spacer(),
                        Icon(Icons.bookmark_border),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text('Liked by user123 and others'
                        ' kenh hx sart nas bres mjas tley hx'),
                  ),
                  SizedBox(height: 12),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
