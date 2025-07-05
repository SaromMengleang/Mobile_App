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
                Image.network("https://tse2.mm.bing.net/th/id/OIP.DexBeSiGPUP4igHscKierwHaCi?rs=1&pid=ImgDetMain&o=7&rm=3",width:175.0),
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
                      decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color.fromARGB(255, 240, 30, 121), width: 3),
                      ),
                      child:CircleAvatar(
                      radius: 30,
                      backgroundImage:
                      NetworkImage('https://i.pravatar.cc/150?img=$index'),
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
                    leading: CircleAvatar(
                      backgroundImage:
                      NetworkImage('https://i.pravatar.cc/150?img=$index'),
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
                      'Liked by user123 and others kenh hx sart nas bres mjas tley hx',
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
