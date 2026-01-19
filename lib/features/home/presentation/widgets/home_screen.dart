import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:online_exam/features/home/presentation/widgets/subjects.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../auth/api/api_client.dart';
import '../../data/model/subject_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ApiClient apiClient;
  bool isSearching = false;
  List<SubjectModel> searchResults = [];
  TextEditingController searchController = TextEditingController();

  final String token = "";

  @override
  void initState() {
    super.initState();
    apiClient = ApiClient(Dio());
  }

  Future<void> performSearch(String query) async {
    if (query.isEmpty) {
      setState(() {
        isSearching = false;
        searchResults.clear();
      });
      return;
    }

    setState(() => isSearching = true);

    try {
      final all = await apiClient.getAllSubjects(token);

      final filtered = all
          .where((s) => s.name.toLowerCase().contains(query.toLowerCase()))
          .toList();

      setState(() {
        searchResults = filtered;
      });
    } catch (e) {
      print("Search error: $e");
    }
  }

  void clearSearch() {
    searchController.clear();
    setState(() {
      isSearching = false;
      searchResults.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Survey",
                  style: TextStyle(
                    color: AppColors.blue,
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: searchController,
                onSubmitted: (value) => performSearch(value),
                decoration: InputDecoration(
                  labelText: "Search",
                  hintText: "Search for your use",
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: searchController.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: clearSearch,
                        )
                      : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onChanged: (value) {
                  setState(() {});
                },
              ),
            ),

            const SizedBox(height: 10),

            if (isSearching) ...[
              for (var s in searchResults)
                SubjectContainer(title: s.name, imagePath: "", subjectId: s.id),
            ] else ...[
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Browse by subject",
                    style: TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              SubjectContainer(
                title: 'Language',
                imagePath: 'assets/images/language.png',
                subjectId: 0,
              ),
              SubjectContainer(
                title: 'Math',
                imagePath: 'assets/images/math.png',
                subjectId: 0,
              ),
              SubjectContainer(
                title: 'Art',
                imagePath: 'assets/images/art.png',
                subjectId: 0,
              ),
              SubjectContainer(
                title: 'Science',
                imagePath: 'assets/images/science.png',
                subjectId: 0,
              ),
            ],
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: DefaultTabController(
          length: 3,
          child: Container(
            decoration: BoxDecoration(color: AppColors.gray),
            child: TabBar(
              indicatorColor: AppColors.black,
              labelColor: AppColors.blue,
              unselectedLabelColor: AppColors.black,
              tabs: [
                Column(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      ),
                      icon: Image.asset(
                        "assets/images/home.png",
                        width: 24,
                        height: 24,
                      ),
                    ),
                    const Text('Explore'),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      ),
                      icon: Image.asset(
                        "assets/images/hh.png",
                        width: 24,
                        height: 24,
                      ),
                    ),
                    const Text('Result'),
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      ),
                      icon: Image.asset(
                        "assets/images/profile.png",
                        width: 24,
                        height: 24,
                      ),
                    ),
                    const Text('Profile'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
