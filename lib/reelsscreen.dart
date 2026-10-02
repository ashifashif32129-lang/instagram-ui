import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ReelsScreen extends StatefulWidget {
  const ReelsScreen({super.key});

  @override
  State<ReelsScreen> createState() => _ReelsScreenState();
}

class _ReelsScreenState extends State<ReelsScreen> {
  final List<String> reels = [
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
  ];

  final List<VideoPlayerController> controllers = [];

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();

    for (final video in reels) {
      final controller = VideoPlayerController.networkUrl(
        Uri.parse(video),
      );

      controllers.add(controller);

      controller.initialize().then((_) {
        if (mounted) {
          setState(() {});
        }
      });
    }
  }

  @override
  void dispose() {
    for (final controller in controllers) {
      controller.dispose();
    }

    super.dispose();
  }

  void playCurrentVideo() {
    for (int i = 0; i < controllers.length; i++) {
      if (i == currentIndex) {
        controllers[i].play();
        controllers[i].setLooping(true);
      } else {
        controllers[i].pause();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: PageView.builder(
        scrollDirection: Axis.vertical,

        itemCount: reels.length,

        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });

          playCurrentVideo();
        },

        itemBuilder: (context, index) {
          final controller = controllers[index];

          if (!controller.value.isInitialized) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          }

          return Stack(
            fit: StackFit.expand,
            children: [

              // VIDEO
              FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: controller.value.size.width,
                  height: controller.value.size.height,
                  child: VideoPlayer(controller),
                ),
              ),

              // RIGHT SIDE ICONS
              Positioned(
                right: 15,
                bottom: 100,
                child: Column(
                  children: [

                    // Like
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),

                    const Text(
                      "1.2K",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 15),

                    // Comment
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.comment_outlined,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),

                    const Text(
                      "120",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 15),

                    // Share
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.send_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),

                    const SizedBox(height: 15),

                    // More
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_vert,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),

              // BOTTOM USER INFO
              Positioned(
                left: 15,
                right: 80,
                bottom: 25,
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [

                    const Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde',
                          ),
                        ),

                        SizedBox(width: 10),

                        Text(
                          "ashif",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),

                        SizedBox(width: 10),

                        Text(
                          "Follow",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "Amazing video 🔥",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Row(
                      children: [
                        Icon(
                          Icons.music_note,
                          color: Colors.white,
                          size: 15,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Original audio",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}