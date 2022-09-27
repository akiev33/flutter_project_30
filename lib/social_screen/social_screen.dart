import 'package:flutter/material.dart';
import 'package:flutter_project_30/Images/resources.dart';
import 'package:flutter_project_30/social_screen/widget/app_bar.dart';
import 'package:flutter_project_30/social_screen/widget/avatar_widget.dart';
import 'package:flutter_project_30/social_screen/widget/button_widget.dart';
import 'package:flutter_project_30/social_screen/widget/friends.dart';
import 'package:flutter_project_30/social_screen/widget/media_section.dart';
import 'package:flutter_project_30/social_screen/widget/select_types.dart';

class GridDataItem {
  final int indexImage;
  final String image;

  GridDataItem({required this.indexImage, required this.image});
}

class SocialApp extends StatefulWidget {
  const SocialApp({super.key});

  @override
  State<SocialApp> createState() => _SocialAppState();
}

class _SocialAppState extends State<SocialApp> {
  final imageController = TextEditingController();
  final nameController = TextEditingController();
  final workController = TextEditingController();

  final List<FriendModel> friends = [
    FriendModel(Images.f1, 'Corey George', 'Developer', 0),
    FriendModel(Images.f2, 'Ahmad Vetrovs', 'Developer', 1),
    FriendModel(Images.f4, 'Cristofer Workman', 'Developer', 3),
    FriendModel(Images.f5, 'Tiana Korsgaard', 'Developer', 4),
  ];

  List<GridDataItem> media = [
    GridDataItem(image: Images.media1, indexImage: 1),
    GridDataItem(image: Images.media2, indexImage: 2),
    GridDataItem(image: Images.media3, indexImage: 3),
    GridDataItem(image: Images.media4, indexImage: 4),
    GridDataItem(image: Images.media5, indexImage: 5),
    GridDataItem(image: Images.media6, indexImage: 6),
    GridDataItem(image: Images.media7, indexImage: 7),
    GridDataItem(image: Images.media8, indexImage: 8),
    GridDataItem(image: Images.media9, indexImage: 9),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SocialAppBar(),
      body: ListView(
        children: [
          const AvatarWidget(),
          const SelectTypesWidget(),
          FriendsWidget(
            friends: friends,
            onDelete: (index) {
              friends.removeWhere((element) => element.index == index);
              setState(() {});
            },
          ),
          ButtonWidget(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('ADD FRIEND'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: imageController,
                          decoration: const InputDecoration(
                            labelText: 'image',
                          ),
                        ),
                        TextField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            labelText: 'name',
                          ),
                        ),
                        TextField(
                          controller: workController,
                          decoration: const InputDecoration(
                            labelText: 'work',
                          ),
                        ),
                      ],
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Exit'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          friends.add(
                            FriendModel(
                              Images.f1,
                              nameController.text,
                              workController.text,
                              friends.length + 1,
                            ),
                          );
                          Navigator.pop(context);
                          setState(() {});
                        },
                        child: const Text('ADD'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          GridSectionWidget(
            media: media,
            onDelete: (indexes) {
              final _array = media;
              for (int i in indexes) {
                media.removeWhere((element) => element.indexImage == i);
              }
              media = _array;
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
