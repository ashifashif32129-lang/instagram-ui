import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController =
  TextEditingController();

  final List<String> images = [
    'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde',
    'https://images.unsplash.com/photo-1500648767791-00dcc994a43e',
    'https://images.unsplash.com/photo-1494790108377-be9c29b29330',
    'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d',
    'https://images.unsplash.com/photo-1534528741775-53994a69daeb',
    'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d',
    'https://images.unsplash.com/photo-1517841905240-472988babdf9',
    'https://images.unsplash.com/photo-1527980965255-d3b416303d12',
    'https://images.unsplash.com/photo-1544005313-94ddf0286df2',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        title: Container(
          height: 42,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12),
          ),

          child: TextField(
            controller: searchController,
            decoration: const InputDecoration(
              hintText: 'Search',
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                vertical: 10,
              ),
            ),
          ),
        ),
      ),

      body: GridView.builder(
        padding: const EdgeInsets.all(2),

        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
        ),

        itemCount: images.length,

        itemBuilder: (context, index) {
          return Image.network(
            images[index],
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}