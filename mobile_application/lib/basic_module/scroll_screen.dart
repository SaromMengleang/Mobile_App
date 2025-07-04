import 'package:flutter/material.dart';
import 'photo_contant.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: SafeArea(child: _buildBody()),
    );
  }

  Widget _buildBody() {
    return Stack(
      alignment: Alignment.center,
      children: [
        _buildMainPage(),
        Positioned(top: 12, left: 0, right: 0, child: _buildTopMenu()),
      ],
    );
  }

  Widget _buildMainPage() {
    return PageView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: imageList.length,
      itemBuilder: (context, index) {
        final item = imageList[index];
        return Stack(
          children: [
            // Background Image
            Positioned.fill(
              child: Image.network(
                item,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(bottom: 100, right: 16, child: _buildRightAppBar()),
            Positioned(bottom: 30, left: 16, right: 100, child: _buildCaption()),
          ],
        );
      },
    );
  }

  Widget _buildTopMenu() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            textStyle: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          child: const Text("Reels"),
        ),
        const SizedBox(width: 300),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.camera_alt, color: Colors.white, size: 26),
        ),
      ],
    );
  }

  Widget _buildRightAppBar() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: const [
        SizedBox(height: 20),
        Icon(Icons.favorite, color: Color.fromARGB(255, 225, 45, 32), size: 32),
        Text("25.5M", style: TextStyle(color: Colors.white)),
        SizedBox(height: 20),
        Icon(Icons.comment, color: Colors.white, size: 32),
        Text("1.5M", style: TextStyle(color: Colors.white)),
        SizedBox(height: 20),
        Icon(Icons.bookmark_outlined, color: Colors.white, size: 32),
        Text("1.7M", style: TextStyle(color: Colors.white)),
        SizedBox(height: 20),
        Icon(Icons.share, color: Colors.white, size: 32),
        Text("1.1M", style: TextStyle(color: Colors.white)),
        SizedBox(height: 20),
      ],
    );
  }
  Widget _buildCaption() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding:EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color.fromARGB(255, 36, 243, 78), width: 2),
              ),
              child: CircleAvatar(
                radius: 22,
                backgroundImage: NetworkImage(
                  'https://images.genius.com/28f3f303c54e8f1a3bfb81e9b992d8cf.1000x1000x1.png',
                ),
              ),
            ),
            const SizedBox(width: 8),
            const Text("@JENNIE_ruby", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
            
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                "Following",
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
            )
          ],
        ),
        const SizedBox(height: 12),
        const Text("Ruby is the debut solo studio album by South Korean singer and rapper Jennie.",
            style: TextStyle(fontSize: 18, color: Colors.white)),
        const Text("#kimjennie#JENNIe#RUBY#Blink",
            style: TextStyle(fontSize: 18, color: Colors.white)),

      ],
    );
  }
}