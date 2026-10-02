import 'package:flutter/material.dart';

class LikeScreen extends StatelessWidget {
  const LikeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Notifications",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),

      body: ListView(
        children: [

          // Like
          ListTile(
            leading: const CircleAvatar(
              backgroundImage: NetworkImage(
                "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde",
              ),
            ),

            title: const Text(
              "ashif",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            subtitle: const Text(
              "liked your post",
            ),

            trailing: const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),

          // Follow
          ListTile(
            leading: const CircleAvatar(
              backgroundImage: NetworkImage(
                "https://images.unsplash.com/photo-1494790108377-be9c29b29330",
              ),
            ),

            title: const Text(
              "meera",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            subtitle: const Text(
              "started following you",
            ),

            trailing: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              child: const Text("Follow"),
            ),
          ),

          // Like
          ListTile(
            leading: const CircleAvatar(
              backgroundImage: NetworkImage(
                "https://images.unsplash.com/photo-1500648767791-00dcc994a43e",
              ),
            ),

            title: const Text(
              "rahul",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            subtitle: const Text(
              "liked your post",
            ),

            trailing: const Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),

          // Follow
          ListTile(
            leading: const CircleAvatar(
              backgroundImage: NetworkImage(
                "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d",
              ),
            ),

            title: const Text(
              "arjun",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            subtitle: const Text(
              "started following you",
            ),

            trailing: ElevatedButton(
              onPressed: () {},
              child: const Text("Follow"),
            ),
          ),
        ],
      ),
    );
  }
}