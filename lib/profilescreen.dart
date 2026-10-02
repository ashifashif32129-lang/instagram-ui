import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      'https://images.unsplash.com/photo-1500648767791-00dcc994a43e',
      'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde',
      'https://images.unsplash.com/photo-1494790108377-be9c29b29330',
      'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d',
      'https://images.unsplash.com/photo-1534528741775-53994a69daeb',
      'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d',
      'https://images.unsplash.com/photo-1517841905240-472988babdf9',
      'https://images.unsplash.com/photo-1527980965255-d3b416303d12',
      'https://images.unsplash.com/photo-1544005313-94ddf0286df2',
    ];

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'ashif',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add_box_outlined,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            const SizedBox(height: 15),

            // PROFILE IMAGE + STATS
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [

                  const CircleAvatar(
                    radius: 45,
                    backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde',
                    ),
                  ),

                  const SizedBox(width: 25),

                  Expanded(
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [

                        _profileStat(
                          '12',
                          'Posts',
                        ),

                        _profileStat(
                          '1.2K',
                          'Followers',
                        ),

                        _profileStat(
                          '320',
                          'Following',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            // NAME + BIO
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [

                    Text(
                      'ASHIF SAHEER',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),

                    SizedBox(height: 4),

                    Text(
                      'Flutter Developer',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),

                    Text(
                      'Building beautiful mobile apps 🚀',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 15),

            // EDIT PROFILE BUTTON
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: SizedBox(
                width: double.infinity,
                height: 36,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: Colors.grey,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Edit Profile',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15),

            const Divider(
              height: 1,
            ),

            // TABS
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceEvenly,
                children: [

                  const Icon(
                    Icons.grid_on,
                    color: Colors.black,
                  ),

                  Icon(
                    Icons.video_collection_outlined,
                    color: Colors.grey.shade600,
                  ),

                  Icon(
                    Icons.person_pin_outlined,
                    color: Colors.grey.shade600,
                  ),
                ],
              ),
            ),

            // POSTS GRID
            GridView.builder(
              shrinkWrap: true,
              physics:
              const NeverScrollableScrollPhysics(),
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
          ],
        ),
      ),
    );
  }

  static Widget _profileStat(
      String number,
      String title,
      ) {
    return Column(
      children: [
        Text(
          number,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          title,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}