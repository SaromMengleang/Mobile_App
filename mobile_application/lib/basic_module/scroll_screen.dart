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
      backgroundColor: Colors.black,
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
        Icon(Icons.favorite_border, color: Colors.white, size: 32),
        SizedBox(height: 4),
        Text("13.2M", style: TextStyle(color: Colors.white)),
        SizedBox(height: 24),
        Icon(Icons.share, color: Colors.white, size: 30),
        SizedBox(height: 4),
        Text("4.1M", style: TextStyle(color: Colors.white)),
        SizedBox(height: 24),
        Icon(Icons.comment, color: Colors.white, size: 30),
        SizedBox(height: 4),
        Text("49.3K", style: TextStyle(color: Colors.white)),
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
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: CircleAvatar(
                radius: 22,
                backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRf6t96mkGf6py35-o8JCFIo4zU_Yf_loFUkw&s',
                ),
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              "@TIXI",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                "Follow",
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
            )
          ],
        ),
        const SizedBox(height: 12),
        const Text(
          "Hi BABE #AUB #viral #Student",
          style: TextStyle(
            fontSize: 17,
            color: Colors.white,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}