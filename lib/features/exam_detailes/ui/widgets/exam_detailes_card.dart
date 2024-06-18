// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'package:omr/core/helpers/spacing.dart';
import 'package:omr/core/models/exam_data.dart';
import 'package:omr/core/theming/colors.dart';

// ignore: must_be_immutable
class ExamDetailesCard extends StatelessWidget {
  ExamData data;
  ExamDetailesCard({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.h,
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    height: 100.h,
                    width: 45.w,
                    decoration: BoxDecoration(
                        color: const Color(0xffeaf2fd),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            DateFormat.MMM().format(
                              data.examDate!,
                            ),
                            style: TextStyle(
                              fontSize: 17.sp,
                              color: ColorsManager.mainBlue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            DateFormat.d().format(
                              data.examDate!,
                            ),
                            style: TextStyle(
                              fontSize: 17.sp,
                              color: ColorsManager.mainBlue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              horizontalSpace(20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.examName!,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    data.subjectName!,
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                  ),
                  verticalSpace(15.0),
                  Wrap(
                    spacing: 20.0,
                    children: [
                      Text('? ${data.numQuestions}'),
                      Wrap(
                        spacing: 5.0,
                        children: [
                          Icon(
                            data.selectedAnswers!.isNotEmpty
                                ? Icons.check_circle_outline_outlined
                                : Icons.cancel_outlined,
                            color: data.selectedAnswers!.isNotEmpty
                                ? Colors.green
                                : Colors.red,
                          ),
                          const Text('Available'),
                        ],
                      ),
                      Wrap(
                        spacing: 5.0,
                        children: [
                          const Icon(
                            Icons.people_outline,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 75.0.w,
                            child: Text(
                              data.className!.name!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          verticalSpace(10.0),
          Divider(color: Colors.grey[300]),
        ],
      ),
    );
  }
}
