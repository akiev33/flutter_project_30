// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_project_30/Images/resources.dart';
import 'package:flutter_project_30/theme/colors.dart';
import 'package:flutter_project_30/theme/text_style.dart';

class FriendsWidget extends StatelessWidget {
  const FriendsWidget({
    Key? key,
    required this.friends,
    required this.onDelete,
  }) : super(key: key);

  final List<FriendModel> friends;
  final Function(int index) onDelete;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Friends',
            style: TextStyles.roboto16w400,
          ),
        ),
        const SizedBox(height: 12),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: friends.length,
          itemBuilder: (context, index) => _FriendItem(
            friend: friends[index],
            onDelete: onDelete,
          ),
          separatorBuilder: (context, index) => Divider(
            height: 16,
            color: AppColors.color212121.withOpacity(0.08),
            // color: Colors.black,
            indent: 72,
          ),
        ),
      ],
    );
  }
}

class _FriendItem extends StatelessWidget {
  const _FriendItem({
    Key? key,
    required this.friend,
    required this.onDelete,
  }) : super(key: key);

  final FriendModel friend;
  final Function(int index) onDelete;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(friend.image),
        radius: 20,
      ),
      title: Text(friend.title, style: TextStyles.listTile),
      subtitle: Text(friend.subtitle, style: TextStyles.listTile2),
      trailing: GestureDetector(
        onTap: () {
          onDelete(friend.index);
        },
        child: Image.asset(Images.redClose, scale: 4),
      ),
    );
  }
}

class FriendModel {
  final String image;
  final String title;
  final String subtitle;
  final int index;

  FriendModel(
    this.image,
    this.title,
    this.subtitle,
    this.index,
  );
}
