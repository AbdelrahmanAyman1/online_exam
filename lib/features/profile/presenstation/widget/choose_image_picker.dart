
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_exam/core/utils/app_assets.dart';
import 'package:online_exam/core/utils/app_colors.dart';

class ChooseImagePicker extends StatelessWidget {
  const ChooseImagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          radius: 40.5,
          backgroundImage: AssetImage(AppAssets.profile),
        ),
        //camare icon
        Positioned(
          bottom: -10,
          right: -1,
          child: Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: AppColors.blue40,
            ),
            child: SvgPicture.asset(AppAssets.photoCameraIcon,),
          ),
        ),
      ],
    );
  }
}
