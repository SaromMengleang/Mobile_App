import 'package:flutter/material.dart';

class InstagramHomePage extends StatelessWidget {
  const InstagramHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Custom Header (Title and Icons)
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Instagram",style: TextStyle(fontSize: 30)),
                Row(
                  children: const [
                    Icon(Icons.favorite_border,size: 30.0,color: Colors.red),
                    SizedBox(width: 16),
                    Icon(Icons.messenger_outline,size: 30.0),
                  ],
                ),
              ],
            ),
          ),

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
                    Container(
                      padding: EdgeInsets.all(3), 
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFFEDA77), 
                            Color(0xFFF58529), 
                            Color(0xFFDD2A7B), 
                            Color(0xFF8134AF), 
                            Color(0xFF515BD4), 
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white, 
                          shape: BoxShape.circle,
                        ),
                        padding: EdgeInsets.all(2), 
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=$index'),
                        ),
                      ),
                    ),

                    SizedBox(height: 4),
                    Text('User$index', style: TextStyle(fontSize: 18)),
                    
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
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFF58529),
                            Color(0xFFDD2A7B),
                            Color(0xFF8134AF),
                            Color(0xFF515BD4),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(3), // border thickness
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white, // optional white inner background
                          ),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=$index'),
                          ),
                        ),
                      ),
                    ),

                    title: Text('User$index',style: TextStyle(fontSize: 18)),
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
                    child: Text(
                      'Liked by Lala_la and others ',
                    ),
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
