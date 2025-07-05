import 'package:flutter/material.dart';


class SearchScreen extends StatefulWidget{
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(75)),
            prefixIcon: Icon(Icons.search),
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: _builbody(),
      
    );
  }

  Widget _builbody(){
    final List<Map<String, String>> recentSearches = [
    {
      'username': 'sgb_online',
      'description': 'Skincare & Cosmetics @SGB.',
      'image': 'https://th.bing.com/th/id/OIP.v89gTkgVxHy7Y9DcU4kgRQHaHa?w=80&h=80&c=1&bgcl=344700&r=0&o=6&pid=ImgRC'
    },
    {
      'username': 'innisfreeofficial',
      'description': 'INNISFREE | 이니스프리',
      'image': 'https://tse3.mm.bing.net/th/id/OIF.OcXvMBPcK1YQ2UyS7RFaNA?rs=1&pid=ImgDetMain&o=7&rm=3'
    },
    {
      'username': 'BLACKPINK',
      'description': 'Blankpink Official',
      'image': 'https://th.bing.com/th/id/R.b12bad512e4242d1854222ae8c809698?rik=T6rhj6tt4lNEVw&pid=ImgRaw&r=0'
    },
    ] ;
    return ListView(
  children: [
    Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(
        'Recent',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    ),
    Divider(),
    ...recentSearches.map((account) {
      return ListTile(
        leading: Container(
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
              shape: BoxShape.circle,
              color: Colors.white, 
            ),
            padding: EdgeInsets.all(2), 
            child: CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(account['image']!),
            ),
          ),
        ),
        title: Text(account['username']!),
        subtitle: Text(account['description']!),
        trailing: Icon(Icons.close),
      );
    }).toList(),
  ],
);

  }

}