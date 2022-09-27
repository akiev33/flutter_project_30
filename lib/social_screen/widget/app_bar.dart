import 'package:flutter/material.dart';
import 'package:flutter_project_30/Images/resources.dart';
import 'package:flutter_project_30/theme/colors.dart';
import 'package:flutter_project_30/theme/text_style.dart';

class SocialAppBar extends StatelessWidget with PreferredSizeWidget {
  const SocialAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1.5,
      backgroundColor: Colors.white,
      leading: Image.asset(
        Images.backIcon,
        scale: 4,
      ),
      centerTitle: false,
      title: Text(
        'Profile',
        style: TextStyles.roboto20w500.copyWith(color: AppColors.color000000),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Image.asset(
            Images.appbarMenu,
            scale: 4,
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(55);
}
