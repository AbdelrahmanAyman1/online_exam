import 'package:flutter/material.dart';
import 'package:online_exam/features/home/presentation/view/explore_view.dart';
import 'package:online_exam/features/profile/presenstation/view/profile_view.dart';
import 'package:online_exam/features/home/presentation/view/result_view.dart';
import 'package:online_exam/features/home/presentation/widget/bottom_nav_bar_widget.dart';

class AppSection extends StatefulWidget {
  static const String routeName = "app_section";
  const AppSection({super.key});

  @override
  State<AppSection> createState() => _AppSectionState();
}

class _AppSectionState extends State<AppSection> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavWidget(currentPage: _currentPageView),
      body: pagesView[currentIndex],
    );
  }

  void _currentPageView(int value) {
    if (value != currentIndex) {
      currentIndex = value;
      setState(() {});
    }
  }

  List<Widget> pagesView = const [ExploreView(), ResultView(), ProfileView()];
}
