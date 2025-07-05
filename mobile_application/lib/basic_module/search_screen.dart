import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    final List<Map<String, String>> recentSearches = [
      {
        'username': 'sgb_online',
        'description': 'Skincare & Cosmetics @SGB.',
        'image':
        'https://th.bing.com/th/id/OIP.v89gTkgVxHy7Y9DcU4kgRQHaHa?w=80&h=80&c=1&bgcl=344700&r=0&o=6&pid=ImgRC'
      },
      {
        'username': 'innisfreeofficial',
        'description': 'INNISFREE | 이니스프리',
        'image':
        'https://tse3.mm.bing.net/th/id/OIF.OcXvMBPcK1YQ2UyS7RFaNA?rs=1&pid=ImgDetMain&o=7&rm=3'
      },
      {
        'username': 'BLACKPINK',
        'description': 'Blankpink Official',
        'image':
        'https://th.bing.com/th/id/R.b12bad512e4242d1854222ae8c809698?rik=T6rhj6tt4lNEVw&pid=ImgRaw&r=0'
      },
    ];

    return ListView(
      children: [
        const SizedBox(height: 40), // Top padding for status bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              filled: true,
              fillColor: Colors.grey.shade200,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(75),
                borderSide: BorderSide.none,
              ),
              prefixIcon: const Icon(Icons.search),
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Recent',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const Divider(),
        ...recentSearches.map((account) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(account['image']!),
            ),
            title: Text(account['username']!),
            subtitle: Text(account['description']!),
            trailing: const Icon(Icons.close),
          );
        }),
      ],
    );
  }
}
