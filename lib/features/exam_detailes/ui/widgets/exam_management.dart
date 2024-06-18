// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omr/core/helpers/extension.dart';
import 'package:omr/core/models/exam_data.dart';
import 'package:omr/core/routing/routes.dart';
import 'package:omr/features/add_exam/logic/exam_cubit.dart';
import 'package:omr/features/exam_detailes/logic/image_cubit.dart';
import 'package:omr/features/exam_detailes/ui/widgets/exam_management_item.dart';

// ignore: must_be_immutable
class ExamManagement extends StatelessWidget {
  ExamData data;
  ExamManagement({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ExamManageMentItem(
          icon: Icons.check_circle_outline_outlined,
          lable: 'Answers',
          onTap: () => context.pushNamed(Routes.answersScreen, arguments: data),
        ),
        ExamManageMentItem(
          icon: Icons.fit_screen_outlined,
          lable: 'Scan Sheet',
          onTap: () async {
            // await context.read<ImageCubit>().pickImageFromCamera();
            var image = context.read<ImageCubit>().state;
            var stdList = data.students!.map((e) => e).toList();
            var exam = ExamData(
              className: data.className,
              examDate: data.examDate,
              examName: data.examName,
              subjectName: data.subjectName,
              examType: data.examType,
              numQuestions: data.numQuestions,
              iMark: data.iMark,
              qMark: data.qMark,
              selectedAnswers: data.selectedAnswers,
              students: [
                ...stdList,
                Student(
                  image: image,
                  stdId: '0925139501',
                  stdName: 'Mazen Fathy',
                ),
              ],
            );

            context.read<ExamCubit>().addOrUpdateExamData(exam);
            context.pushNamed(Routes.homeScreen);
          },
        ),
        ExamManageMentItem(
          icon: Icons.attach_file_outlined,
          lable: 'Report',
          onTap: () {
            context.pushNamed(Routes.reportScreen, arguments: data);
          },
        ),
      ],
    );
  }
}
