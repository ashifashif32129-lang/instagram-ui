import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_ui_1/likepage.dart';
import 'package:instagram_ui_1/profilescreen.dart';
import 'package:instagram_ui_1/reelsscreen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'addscreen.dart';
import 'camerascreen.dart';
import 'searchscreen.dart';

import 'dart:io';

class InstagramApp extends StatefulWidget {
  const InstagramApp({super.key});

  @override
  State<InstagramApp> createState() => _InstagramAppState();
}

class _InstagramAppState extends State<InstagramApp> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    HomeScreen(),
    SearchScreen(),
    AddScreen(),
    ReelsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,

        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },

        type: BottomNavigationBarType.fixed,

        backgroundColor: Colors.white,

        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,

        showSelectedLabels: false,
        showUnselectedLabels: false,

        items: const [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.house),
            activeIcon: FaIcon(FontAwesomeIcons.house),
            label: "Home",
          ),

          BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.magnifyingGlass), label: "Search"),

          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.squarePlus),
            activeIcon: FaIcon(FontAwesomeIcons.squarePlus),
            label: "Add",
          ),

          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.clapperboard),
            activeIcon: FaIcon(FontAwesomeIcons.clapperboard),
            label: "Reels",
          ),

          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.user),
            activeIcon:FaIcon(FontAwesomeIcons.user),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ImagePicker picker = ImagePicker();
  XFile? storyFile;

  Future<void> addStory() async {
    final XFile? file = await picker.pickMedia();

    if (file != null) {
      setState(() {
        storyFile = file;
      });
    }
  }

  bool isLiked1 = false;
  bool isLiked2 = false;
  bool isLiked3 = false;
  bool isLiked4 = false;
  bool isLiked5 = false;

  bool isSave1 = false;
  bool isSave2 = false;
  bool isSave3 = false;
  bool isSave4 = false;
  bool isSave5 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LikeScreen( ),
                  ),
                );
              },
              icon: Icon(Icons.favorite_outline_outlined),
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CameraScreen(),
              ),
            );
          },
          icon: const Icon(Icons.add),
        ),
        centerTitle: true,
        title: Image.asset('images/34.jpg', scale: 5),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const SizedBox(width: 10),

                Column(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.grey,
                          backgroundImage: storyFile != null
                              ? FileImage(File(storyFile!.path))
                              : null,
                        ),

                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: GestureDetector(
                            onTap: addStory,
                            child: Container(
                              width: 22,
                              height: 22,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 5),

                    const Text('Your story'),
                  ],
                ),

                const SizedBox(width: 15),

                Column(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde',
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text('ashif'),
                  ],
                ),

                const SizedBox(width: 15),

                Column(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e',
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text('rahul'),
                  ],
                ),

                const SizedBox(width: 15),

                Column(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d',
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text('arjun'),
                  ],
                ),

                const SizedBox(width: 15),

                Column(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1494790108377-be9c29b29330',
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text('meera'),
                  ],
                ),

                const SizedBox(width: 15),

                Column(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d',
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text('rahul'),
                  ],
                ),

                const SizedBox(width: 15),

                Column(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1534528741775-53994a69daeb',
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text('neha'),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(17, 0, 0, 0),
                child: CircleAvatar(
                  radius: 15,
                  backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1534528741775-53994a69daeb',
                  ),
                ),
              ),
              SizedBox(width: 8),
              Text('neha_'),
              SizedBox(width: 257),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_vert_outlined),
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
            width: 150,
            height: 500,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(0)),
            clipBehavior: Clip.antiAlias,
            child: Image.network(
              'https://images.unsplash.com/photo-1534528741775-53994a69daeb',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    isLiked1 = !isLiked1;
                  });
                },
                icon: FaIcon(
                  isLiked1
                      ? FontAwesomeIcons.solidHeart
                      : FontAwesomeIcons.heart,
                  color: isLiked1 ? Colors.red : Colors.black,
                ),
              ),
              IconButton(onPressed: () {}, icon: FaIcon(FontAwesomeIcons.comment
              )),
              IconButton(onPressed: () {}, icon: FaIcon(FontAwesomeIcons.paperPlane
              )),
              SizedBox(width: 210),
              IconButton(onPressed: () {
                setState(() {
                  isSave1 = !isSave1;
                });
              }, icon: FaIcon(
                  isSave1
                      ? FontAwesomeIcons.solidBookmark
                      : FontAwesomeIcons.bookmark,
                      color: Colors.black,
              )),
            ],
          ),

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(17, 0, 0, 0),
                child: CircleAvatar(
                  radius: 15,
                  backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde',
                  ),
                ),
              ),
              SizedBox(width: 8),
              Text('ashf_'),
              SizedBox(width: 257),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_vert_outlined),
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
            width: 150,
            height: 500,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(0)),
            clipBehavior: Clip.antiAlias,
            child: Image.network(
              'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    isLiked2 = !isLiked2;
                  });
                },
                icon: FaIcon(
                  isLiked2
                      ? FontAwesomeIcons.solidHeart
                      : FontAwesomeIcons.heart,
                  color: isLiked2 ? Colors.red : Colors.black,
                ),
              ),
              IconButton(onPressed: () {}, icon: FaIcon(FontAwesomeIcons.comment
              )),
              IconButton(onPressed: () {}, icon: FaIcon(FontAwesomeIcons.paperPlane
              )),
              SizedBox(width: 210),
              IconButton(onPressed: () {
                setState(() {
                  isSave1 = !isSave1;
                });
              }, icon: FaIcon(
                isSave1
                    ? FontAwesomeIcons.solidBookmark
                    : FontAwesomeIcons.bookmark,
                color: Colors.black,
              )),
            ],
          ),

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(17, 0, 0, 0),
                child: CircleAvatar(
                  radius: 15,
                  backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1494790108377-be9c29b29330',
                  ),
                ),
              ),
              SizedBox(width: 8),
              Text('meera_'),
              SizedBox(width: 248),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_vert_outlined),
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
            width: 150,
            height: 500,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(0)),
            clipBehavior: Clip.antiAlias,
            child: Image.network(
              'https://images.unsplash.com/photo-1494790108377-be9c29b29330',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    isLiked3 = !isLiked3;
                  });
                },
                icon: FaIcon(
                  isLiked3
                      ? FontAwesomeIcons.solidHeart
                      : FontAwesomeIcons.heart,
                  color: isLiked3 ? Colors.red : Colors.black,
                ),
              ),
              IconButton(onPressed: () {}, icon: FaIcon(FontAwesomeIcons.comment
              )),
              IconButton(onPressed: () {}, icon: FaIcon(FontAwesomeIcons.paperPlane
              )),
              SizedBox(width: 210),
              IconButton(onPressed: () {
                setState(() {
                  isSave1 = !isSave1;
                });
              }, icon: FaIcon(
                isSave1
                    ? FontAwesomeIcons.solidBookmark
                    : FontAwesomeIcons.bookmark,
                color: Colors.black,
              )),
            ],
          ),

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(17, 0, 0, 0),
                child: CircleAvatar(
                  radius: 15,
                  backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d',
                  ),
                ),
              ),
              SizedBox(width: 8),
              Text('arjun_'),
              SizedBox(width: 247),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_vert_outlined),
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
            width: 150,
            height: 500,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(0)),
            clipBehavior: Clip.antiAlias,
            child: Image.network(
              'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    isLiked4 = !isLiked4;
                  });
                },
                icon: FaIcon(
                  isLiked4
                      ? FontAwesomeIcons.solidHeart
                      : FontAwesomeIcons.heart,
                  color: isLiked4 ? Colors.red : Colors.black,
                ),
              ),
              IconButton(onPressed: () {}, icon: FaIcon(FontAwesomeIcons.comment
              )),
              IconButton(onPressed: () {}, icon: FaIcon(FontAwesomeIcons.paperPlane
              )),
              SizedBox(width: 210),
              IconButton(onPressed: () {
                setState(() {
                  isSave1 = !isSave1;
                });
              }, icon: FaIcon(
                isSave1
                    ? FontAwesomeIcons.solidBookmark
                    : FontAwesomeIcons.bookmark,
                color: Colors.black,
              )),
            ],
          ),

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(17, 0, 0, 0),
                child: CircleAvatar(
                  radius: 15,
                  backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1500648767791-00dcc994a43e',
                  ),
                ),
              ),
              SizedBox(width: 8),
              Text('rahul_'),
              SizedBox(width: 247),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_vert_outlined),
              ),
            ],
          ),
          SizedBox(height: 10),

          Container(
            width: 150,
            height: 500,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(0)),
            clipBehavior: Clip.antiAlias,
            child: Image.network(
              'https://images.unsplash.com/photo-1500648767791-00dcc994a43e',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    isLiked5 = !isLiked5;
                  });
                },
                icon: FaIcon(
                  isLiked5
                      ? FontAwesomeIcons.solidHeart
                      : FontAwesomeIcons.heart,
                  color: isLiked5 ? Colors.red : Colors.black,
                ),
              ),
              IconButton(onPressed: () {}, icon:FaIcon(FontAwesomeIcons.comment
              )),
              IconButton(onPressed: () {}, icon: FaIcon(FontAwesomeIcons.paperPlane
              )),
              SizedBox(width: 210),
              IconButton(onPressed: () {
                setState(() {
                  isSave1 = !isSave1;
                });
              }, icon: FaIcon(
                isSave1
                    ? FontAwesomeIcons.solidBookmark
                    : FontAwesomeIcons.bookmark,
                color: Colors.black,
              )),
            ],
          ),
SizedBox(height: 20,),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 10),
                Text(
                  "Loading...",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
