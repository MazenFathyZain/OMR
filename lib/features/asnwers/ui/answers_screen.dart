import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omr/core/helpers/extension.dart';
import 'package:omr/core/helpers/spacing.dart';
import 'package:omr/core/models/exam_data.dart';
import 'package:omr/core/routing/routes.dart';
import 'package:omr/core/theming/colors.dart';
import 'package:omr/features/add_exam/logic/exam_cubit.dart';

class AnswersScreen extends StatefulWidget {
  const AnswersScreen({super.key});

  @override
  State<AnswersScreen> createState() => _AnswersScreenState();
}

class _AnswersScreenState extends State<AnswersScreen> {
  List<String?> selectedAnswers = List<String?>.filled(100, null);
  List<Widget> _generateChoiceWidgets(int count, int index, ExamData data) {
    return List<Widget>.generate(count, (i) {
      return Row(
        children: [
          Text('${i + 1}'),
          Radio<String>(
            fillColor: MaterialStateProperty.resolveWith(
              (states) {
                if (states.contains(MaterialState.selected)) {
                  return Colors
                      .blue; // Replace ColorsManager.mainBlue with Colors.blue
                }
                return Colors.grey;
              },
            ),
            value: '${i + 1}',
            groupValue: selectedAnswers[index],
            onChanged: (String? value) {
              setState(() {
                selectedAnswers[index] = value;
              });
            },
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final ExamData data =
        ModalRoute.of(context)?.settings.arguments as ExamData;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorsManager.lightBlue,
        child: const Icon(
          Icons.check,
          color: ColorsManager.mainBlue,
        ),
        onPressed: () {
          context.read<ExamCubit>().addOrUpdateExamData(
                ExamData(
                  className: data.className,
                  examDate: data.examDate,
                  examName: data.examName,
                  subjectName: data.subjectName,
                  examType: data.examType,
                  numQuestions: data.numQuestions,
                  iMark: data.iMark,
                  qMark: data.qMark,
                  selectedAnswers: selectedAnswers,
                  students: data.students,
                ),
              );
          context.pushNamed(Routes.homeScreen);
        },
      ),
      appBar: AppBar(
        title: Text(
          'Answers',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 19.sp,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.7,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0.h, horizontal: 20.0.h),
        child: ListView.builder(
          itemCount: data.numQuestions,
          itemBuilder: (context, index) {
            if (data.examType == 'True/False') {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Question ${index + 1}',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ListTile(
                                title: const Text('True'),
                                leading: Radio<String>(
                                  fillColor: MaterialStateProperty.resolveWith(
                                    (states) {
                                      if (states
                                          .contains(MaterialState.selected)) {
                                        return ColorsManager.mainBlue;
                                      }
                                      return Colors.grey;
                                    },
                                  ),
                                  value: 'True',
                                  groupValue: selectedAnswers[index],
                                  onChanged: (String? value) {
                                    setState(() {
                                      selectedAnswers[index] = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: ListTile(
                                title: Text('False'),
                                leading: Radio<String>(
                                  fillColor: MaterialStateProperty.resolveWith(
                                    (states) {
                                      if (states
                                          .contains(MaterialState.selected)) {
                                        return ColorsManager.mainBlue;
                                      }
                                      return Colors.grey;
                                    },
                                  ),
                                  value: 'False',
                                  groupValue: selectedAnswers[index],
                                  onChanged: (String? value) {
                                    setState(() {
                                      selectedAnswers[index] = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(color: Colors.grey[300]),
                  verticalSpace(10.0.h),
                ],
              );
            } else {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Question ${index + 1}',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: _generateChoiceWidgets(
                              checkType(data), index, data),
                        ),
                      ],
                    ),
                  ),
                  Divider(color: Colors.grey[300]),
                  verticalSpace(10.0.h),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  int checkType(ExamData data) {
    if (data.examType == '4 Options') {
      return 4;
    } else if (data.examType == '5 Options') {
      return 5;
    } else {
      return 3;
    }
  }
}
