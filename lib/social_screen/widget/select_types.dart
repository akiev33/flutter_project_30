import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_project_30/theme/colors.dart';
import 'package:flutter_project_30/theme/text_style.dart';

class SelectTypesWidget extends StatefulWidget {
  const SelectTypesWidget({super.key});

  @override
  State<SelectTypesWidget> createState() => _SelectTypesWidgetState();
}

class _SelectTypesWidgetState extends State<SelectTypesWidget> {
  bool isActive = false;
  int currenIndex = 0;
  final List<String> _types = [
    'balck',
    'smkdlas',
    'sadknaksd',
    'sdaldsakdjs',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Select type',
            style: TextStyles.roboto16w400.copyWith(letterSpacing: 0.44),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 32,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => _SelectItem(
                text: _types[index],
                isActive: currenIndex == index,
                onTap: () {
                  currenIndex = index;
                  setState(() {});
                }),
            itemCount: _types.length,
            separatorBuilder: (context, index) => const SizedBox(width: 8),
          ),
        ),
        const SizedBox(height: 16),
        Divider(
          height: 1,
          color: AppColors.color212121.withOpacity(0.08),
          indent: 18,
          endIndent: 18,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

class _SelectItem extends StatelessWidget {
  const _SelectItem({
    Key? key,
    required this.text,
    required this.isActive,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final bool isActive;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 6,
        ),
        decoration: BoxDecoration(
          color: isActive ? AppColors.colorF2E7FE : AppColors.colorGrey,
          border: isActive ? Border.all(color: AppColors.colorDBB2FF) : null,
          borderRadius: BorderRadius.circular(68),
        ),
        child: Text(
          text,
          // style: TextStyles.roboto12w400.copyWith(
          //   color: AppColors.color000000.withOpacity(0.38),
          // ),
          style: TextStyles.roboto14w400.copyWith(
            color: isActive
                ? AppColors.color6200EE
                : AppColors.color000000.withOpacity(0.38),
          ),
        ),
      ),
    );
  }
}
