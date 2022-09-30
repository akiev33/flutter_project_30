import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_project_30/Images/resources.dart';
import 'package:flutter_project_30/social_screen/social_screen.dart';
import 'package:flutter_project_30/theme/colors.dart';
import 'package:flutter_project_30/theme/text_style.dart';

class GridSectionWidget extends StatefulWidget {
  const GridSectionWidget({
    super.key,
    required this.media,
    required this.onDelete,
  });

  final List<GridDataItem> media;
  final Function(List<int> indexes) onDelete;

  @override
  State<GridSectionWidget> createState() => _GridSectionWidgetState();
}

class _GridSectionWidgetState extends State<GridSectionWidget> {
  final List<int> indexes = [];

  @override
  void didUpdateWidget(covariant GridSectionWidget oldWidget) {
    indexes.clear();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'My media',
            style: TextStyles.roboto24w400,
          ),
        ),
        const SizedBox(height: 16),
        GridView.builder(
          itemBuilder: (context, index) => GridItem(
            image: widget.media[index].image,
            index: widget.media[index].indexImage,
            onPressed: (indexFrom) {
              if (indexes.contains(indexFrom)) {
                indexes.removeWhere((element) => element == indexFrom);
              } else {
                indexes.add(indexFrom);
              }
            },
          ),
          itemCount: widget.media.length,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 13,
            mainAxisExtent: 96,
          ),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.color6200EE),
                    onPressed: () {
                      if (indexes.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Error, Select image to delete!'),
                          ),
                        );
                      }
                      widget.onDelete(indexes);
                    },
                    child: Text(
                      'DELETE',
                      style: TextStyles.roboto14w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: AppColors.color000000.withOpacity(0.12),
                          width: 1,
                        ),
                      ),
                    ),
                    child: Text(
                      'ADD',
                      style: TextStyles.roboto14w500
                          .copyWith(color: AppColors.color6200EE),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class GridItem extends StatefulWidget {
  const GridItem({
    super.key,
    required this.image,
    required this.index,
    required this.onPressed,
  });

  final String image;
  final int index;
  final Function(int index) onPressed;

  @override
  State<GridItem> createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  bool isActive = false;

  @override
  void didUpdateWidget(covariant GridItem oldWidget) {
    isActive = false;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        isActive = !isActive;
        widget.onPressed(widget.index);
        setState(() {});
      },
      child: Stack(
        children: [
          Image.asset(
            widget.image,
            fit: BoxFit.cover,
            scale: 4,
          ),
          if (isActive)
            Positioned(
              right: 30,
              top: 8,
              child: Container(
                height: 24,
                width: 24,
                // padding: const EdgeInsets.all(3.5),
                decoration: BoxDecoration(
                  color: AppColors.colorCF6679,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white,
                    width: 1.5,
                  ),
                ),
                child: SizedBox(
                  child: Image.asset(
                    Images.whiteClose,
                    scale: 4,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
