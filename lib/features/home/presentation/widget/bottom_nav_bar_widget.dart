import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_exam/core/utils/app_assets.dart';
import 'package:online_exam/core/utils/app_colors.dart';
import 'package:online_exam/core/utils/text_styles.dart';

class BottomNavWidget extends StatefulWidget {
  const BottomNavWidget({super.key, required this.currentPage});
  final ValueChanged<int> currentPage;
  @override
  State<BottomNavWidget> createState() => _BottomNavWidgetState();
}

class _BottomNavWidgetState extends State<BottomNavWidget> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (value) {
        currentIndex = value;
        widget.currentPage(value);
      },
      currentIndex: currentIndex,
      selectedLabelStyle: TextStyles.medium16.copyWith(
        color: AppColors.blue100,
      ),
      unselectedLabelStyle: TextStyles.medium16,
      iconSize: 23,
      items: listOfBottomNavItem,
    );
  }

  Widget _buildActiveIcon(String assetName) {
    return Container(
      height: 32,
      width: 64,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.bottomNavBarBackgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: SvgPicture.asset(assetName, height: 24, width: 24),
    );
  }

  List<BottomNavigationBarItem> get listOfBottomNavItem => [
    BottomNavigationBarItem(
      icon: SvgPicture.asset(AppAssets.homeInActiveIcon),
      activeIcon: _buildActiveIcon(AppAssets.homeActiveIcon),
      label: "Explore",
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(AppAssets.resultInActiveIcon),
      activeIcon: _buildActiveIcon(AppAssets.resultActiveIcon),
      label: "Result",
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(AppAssets.profileInActiveIcon),
      activeIcon: _buildActiveIcon(AppAssets.profileActiveIcon),
      label: "Profile",
    ),
  ];
}
