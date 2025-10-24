import 'package:flutter/material.dart';
import 'package:online_exam/features/home/presentation/widgets/subject_details_screen.dart';

class SubjectContainer extends StatelessWidget {
  final String title;
  final String imagePath;
  final int subjectId;

  const SubjectContainer({
    super.key,
    required this.title,
    required this.imagePath,
    required this.subjectId,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SubjectDetailsScreen(subjectId: subjectId, title: title, token: '',),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Image.asset(imagePath, height: 50, width: 50),
            const SizedBox(width: 20),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
