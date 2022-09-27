import 'package:flutter/material.dart';
import 'package:flutter_project_30/Images/resources.dart';
import 'package:flutter_project_30/theme/colors.dart';
import 'package:flutter_project_30/theme/text_style.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            const CircleAvatar(
              radius: 59,
              backgroundImage: AssetImage(Images.avatars),
            ),
            Container(
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                color: AppColors.color6200EE,
                shape: BoxShape.circle,
                border: Border.all(
                  width: 1.5,
                  color: AppColors.colorFFFFFF,
                ),
              ),
              child: Image.asset(
                Images.whiteIcon,
                scale: 4,
              ),
            )
          ],
        ),
        const SizedBox(height: 24),
        Text(
          'Tiana Rosser',
          style: TextStyles.roboto16w400,
        ),
        Text(
          'Developer',
          style: TextStyles.roboto12w400.copyWith(
            color: AppColors.color666666,
          ),
        ),
        const SizedBox(height: 24),
        Divider(
          height: 1,
          color: AppColors.color212121.withOpacity(0.08),
          indent: 18,
          endIndent: 18,
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
