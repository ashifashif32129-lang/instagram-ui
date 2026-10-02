import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final ImagePicker picker = ImagePicker();

  XFile? selectedFile;
  bool isVideo = false;

  final TextEditingController captionController =
  TextEditingController();

  Future<void> pickFromGallery() async {
    final XFile? file = await picker.pickMedia();

    if (file != null) {
      setState(() {
        selectedFile = file;
        isVideo = file.path.endsWith('.mp4') ||
            file.path.endsWith('.mov') ||
            file.path.endsWith('.avi');
      });
    }
  }

  Future<void> openCamera() async {
    final XFile? file = await picker.pickImage(
      source: ImageSource.camera,
    );

    if (file != null) {
      setState(() {
        selectedFile = file;
        isVideo = false;
      });
    }
  }

  void createPost() {
    if (selectedFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Select a photo or video first"),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Post created successfully"),
      ),
    );
  }

  @override
  void dispose() {
    captionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),

        title: const Text(
          "New post",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: [
          TextButton(
            onPressed: createPost,
            child: const Text(
              "Share",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            // IMAGE / VIDEO PREVIEW
            Container(
              width: double.infinity,
              height: 350,
              color: Colors.grey.shade200,

              child: selectedFile == null
                  ? Column(
                mainAxisAlignment:
                MainAxisAlignment.center,
                children: [

                  const Icon(
                    Icons.photo_library_outlined,
                    size: 70,
                    color: Colors.grey,
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    "Select a photo or video",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    children: [

                      ElevatedButton.icon(
                        onPressed: pickFromGallery,
                        icon: const Icon(
                          Icons.photo_library,
                        ),
                        label: const Text(
                          "Gallery",
                        ),
                      ),

                      const SizedBox(width: 10),

                      ElevatedButton.icon(
                        onPressed: openCamera,
                        icon: const Icon(
                          Icons.camera_alt,
                        ),
                        label: const Text(
                          "Camera",
                        ),
                      ),
                    ],
                  ),
                ],
              )
                  : isVideo
                  ? const Center(
                child: Icon(
                  Icons.play_circle_outline,
                  size: 80,
                ),
              )
                  : Image.file(
                File(selectedFile!.path),
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 10),

            // CHANGE MEDIA
            if (selectedFile != null)
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [

                    TextButton.icon(
                      onPressed: pickFromGallery,
                      icon: const Icon(
                        Icons.photo_library_outlined,
                      ),
                      label: const Text(
                        "Change",
                      ),
                    ),

                    const Spacer(),

                    IconButton(
                      onPressed: () {
                        setState(() {
                          selectedFile = null;
                        });
                      },
                      icon: const Icon(
                        Icons.delete_outline,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),

            const Divider(),

            // CAPTION
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [

                  const CircleAvatar(
                    radius: 22,
                    backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde",
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: TextField(
                      controller: captionController,
                      maxLines: 5,
                      decoration: const InputDecoration(
                        hintText: "Write a caption...",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const Divider(),

            // OPTIONS
            ListTile(
              leading: const Icon(
                Icons.location_on_outlined,
              ),
              title: const Text(
                "Add location",
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
              onTap: () {},
            ),

            ListTile(
              leading: const Icon(
                Icons.person_add_outlined,
              ),
              title: const Text(
                "Tag people",
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
              onTap: () {},
            ),

            ListTile(
              leading: const Icon(
                Icons.music_note_outlined,
              ),
              title: const Text(
                "Add music",
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
              onTap: () {},
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}