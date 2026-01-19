import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:online_exam/features/home/presentation/widgets/home_screen.dart';

import '../../../auth/api/api_client.dart';
import '../../data/model/subject_model.dart';

class SubjectDetailsScreen extends StatefulWidget {
  final String token;
  final int subjectId;
  final String title;

  const SubjectDetailsScreen({
    super.key,
    required this.token,
    required this.subjectId,
    required this.title,
  });

  @override
  State<SubjectDetailsScreen> createState() => _SubjectDetailsScreenState();
}

class _SubjectDetailsScreenState extends State<SubjectDetailsScreen> {
  List<SubjectModel> subjects = [];

  @override
  void initState() {
    super.initState();
    _loadSubjects();
  }

  Future<void> _loadSubjects() async {
    final dio = Dio();
    final api = ApiClient(dio);

    final data = await api.getAllSubjects(widget.token);

    setState(() => subjects = data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading:false,
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),

            Text(widget.title),

            const Spacer(),
          ],
        ),
      ),

      body: subjects.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: subjects.length,
        itemBuilder: (context, index) {
          final s = subjects[index];
          return ListTile(
            title: Text(s.name),
            subtitle: Text(s.id.toString()),
          );
        },
      ),
    );
  }
}
