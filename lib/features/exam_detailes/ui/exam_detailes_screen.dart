import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omr/core/helpers/spacing.dart';
import 'package:omr/core/models/exam_data.dart';
import 'package:omr/features/exam_detailes/ui/widgets/exam_detailes_card.dart';
import 'package:omr/features/exam_detailes/ui/widgets/exam_management.dart';

class ExamDetailesScreen extends StatelessWidget {
  const ExamDetailesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ExamData data =
        ModalRoute.of(context)?.settings.arguments as ExamData;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Exam Detailes',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 19.sp,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.7,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ExamDetailesCard(data: data),
            verticalSpace(20.0),
            Text(
              'Exam Management',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19.sp,
              ),
            ),
            verticalSpace(20.0),
            ExamManagement(data: data),
          ],
        ),
      ),
    );
  }
}
