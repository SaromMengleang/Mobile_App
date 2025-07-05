import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("izme_Wonie Tixi"),
          actions: const [
            Icon(Icons.link),
            SizedBox(width: 10),
            Icon(Icons.add_box_outlined),
            SizedBox(width: 10),
            Icon(Icons.menu),
            SizedBox(width: 10),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildProfileHeader(),
              _buildProfileStats(),
              _buildActionButtons(),
              _buildTabIcons(),
              _buildPostGrid(),
            ],
          ),
        )
    );
  }

  Widget _buildProfileHeader() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                padding: EdgeInsets.all(4), // Border thickness
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
                  padding: EdgeInsets.all(2), // Inner white gap
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                      "https://images.genius.com/28f3f303c54e8f1a3bfb81e9b992d8cf.1000x1000x1.png",
                    ),
                  ),
                ),
              ),
              CircleAvatar(
                radius: 12,
                backgroundColor: Colors.blue,
                child: Icon(Icons.add, color: Colors.white, size: 16),
              )
            ],
          ),

          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("@Wonie_Tixi", style: TextStyle(color: Color.fromARGB(255, 13, 13, 13), fontSize: 20)),
              SizedBox(height: 4),
              Text("What's new?", style: TextStyle(color: Color.fromARGB(255, 9, 9, 9))),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProfileStats() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          _StatItem(label: "posts", count: "1"),
          _StatItem(label: "followers", count: "52"),
          _StatItem(label: "following", count: "87"),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Expanded(child: _borderButton("Edit profile")),
          const SizedBox(width: 10),
          Expanded(child: _borderButton("Share profile")),
          const SizedBox(width: 10),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.person_add, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _borderButton(String label) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(label, style: const TextStyle(color: Colors.white)),
    );
  }
  Widget _buildTabIcons() {
    return const Padding(
      padding: EdgeInsets.only(top: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.grid_on, color: Colors.white),
          Icon(Icons.video_call, color: Colors.grey),
          Icon(Icons.person_pin_outlined, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildPostGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
      ),
      itemCount: 50, // replace with user content count
      shrinkWrap: true, // Important to work inside SingleChildScrollView
      physics: const NeverScrollableScrollPhysics(), // Prevent inner scrolling
      itemBuilder: (context, index) {
        return Image.network(
          'https://picsum.photos/200?random=$index',
          fit: BoxFit.cover,
        );
      },
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String count;
  const _StatItem({required this.label, required this.count});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(count, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(color: Colors.white70)),
      ],
    );
  }
}
