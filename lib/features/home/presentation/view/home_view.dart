import 'package:flutter/material.dart';
import 'package:online_exam/features/home/presentation/view/explore_view.dart';
import 'package:online_exam/features/home/presentation/view/profile_view.dart';
import 'package:online_exam/features/home/presentation/view/result_view.dart';
import 'package:online_exam/features/home/presentation/widget/bottom_nav_bar_widget.dart';

class HomeView extends StatefulWidget {
  static const String routeName = "home_view";
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
