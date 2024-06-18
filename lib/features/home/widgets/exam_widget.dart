import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omr/core/helpers/extension.dart';
import 'package:omr/core/routing/routes.dart';
import 'package:omr/core/models/exam_data.dart';
import 'package:omr/features/add_exam/logic/exam_cubit.dart';
import 'package:omr/features/home/widgets/exam_detailes_card.dart';

class ExamWidget extends StatelessWidget {
  const ExamWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExamCubit, List<ExamData>>(
      builder: (context, data) {
        if (data.isEmpty) {
          return const Center(child: Text('No data available.'));
        }
        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                context.pushNamed(
                  Routes.examDetailesScreen,
                  arguments: data[index],
                );
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                child: Column(
                  children: [
                    ExamDetailesCard(data: data[index]),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
