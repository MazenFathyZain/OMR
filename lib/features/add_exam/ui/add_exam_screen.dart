import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:omr/core/helpers/extension.dart';
import 'package:omr/core/helpers/spacing.dart';
import 'package:omr/core/routing/routes.dart';
import 'package:omr/core/theming/colors.dart';
import 'package:omr/core/theming/styles.dart';
import 'package:omr/core/widgets/app_drop_down_button.dart';
import 'package:omr/core/widgets/app_text_button.dart';
import 'package:omr/core/widgets/app_text_form_field.dart';
import 'package:omr/core/models/exam_data.dart';
import 'package:omr/features/add_exam/logic/exam_cubit.dart';

class AddExamScreen extends StatefulWidget {
  const AddExamScreen({super.key});

  @override
  State<AddExamScreen> createState() => _AddExamScreenState();
}

class _AddExamScreenState extends State<AddExamScreen> {
  String type = 'True/False';
  int num = 10;
  int mark = 1;
  int iMark = 0;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ExamCubit>();
    print(DateFormat.yMMMd().format(DateTime.now()));
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
        child: SingleChildScrollView(
          child: BlocBuilder<ExamCubit, List<ExamData>>(
            builder: (context, state) {
              return Form(
                key: cubit.formKey,
                child: Column(
                  children: [
                    Text(
                      'Exam Detailes',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                      ),
                    ),
                    verticalSpace(20.h),
                    AppTextFormField(
                      controller: cubit.subjectNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please Enter a subject name';
                        }
                      },
                      hintText: 'Subject name',
                    ),
                    verticalSpace(15.h),
                    AppTextFormField(
                      controller: cubit.classNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please Enter a subject name';
                        }
                      },
                      hintText: 'class name',
                    ),
                    verticalSpace(15.h),
                    AppTextFormField(
                      controller: cubit.examNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please Enter a subject name';
                        }
                      },
                      hintText: 'Exam name',
                    ),
                    verticalSpace(15.h),
                    AppDropDwonButton(
                      value: type,
                      lable: 'Question Type:',
                      items: const [
                        'True/False',
                        '3 Options',
                        '4 Options',
                        '5 Options'
                      ],
                      onChanged: (value) {
                        setState(() {
                          type = value!;
                        });
                      },
                    ),
                    verticalSpace(15.h),
                    AppDropDwonButton(
                      value: num,
                      lable: 'Number of questions:',
                      items: const [10, 20, 30, 40, 50, 60, 70, 80, 90, 100],
                      onChanged: (value) {
                        setState(() {
                          num = value;
                        });
                      },
                    ),
                    verticalSpace(15.h),
                    AppDropDwonButton(
                      value: mark,
                      lable: 'Question mark',
                      items: const [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
                      onChanged: (value) {
                        setState(() {
                          mark = value!;
                        });
                      },
                    ),
                    verticalSpace(15.h),
                    AppDropDwonButton(
                      value: iMark,
                      lable: 'InCorrect mark',
                      items: const [-1, 0, 1],
                      onChanged: (value) {
                        setState(() {
                          iMark = value!;
                        });
                      },
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            cubit.selectedDate != null
                                ? 'Exam Date : ${DateFormat.yMMMd().format(cubit.selectedDate!.toLocal())}'
                                : 'Select Exam Date',
                          ),
                        ),
                        TextButton(
                          onPressed: () => cubit.selectDate(context),
                          child: const Text(
                            'Select Date',
                            style: TextStyle(
                              color: ColorsManager.mainBlue,
                            ),
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(25.h),
                    AppTextButton(
                      buttonText: "Add Exam",
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        validateThenDoLogin(context);
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    final cubit = context.read<ExamCubit>();
    // final newExam = ExamData(
    //     subjectName: 's',
    //     examName: 'ss',
    //     className: ClassName(name: 'dsa', stdList: []),
    //     examDate: DateTime.now(),
    //     examType: 'sda',
    //     iMark: 1,
    //     numQuestions: 1,
    //     qMark: 2,
    //     selectedAnswers: [],
    //     students: [
    //       Student(
    //         image: '',
    //         stdId: '',
    //         stdName: '',
    //       )
    //     ]);
    // context.read<ExamCubit>().addExam(newExam);
    // context.pushNamed(Routes.homeScreen);

    if (cubit.formKey.currentState!.validate()) {
      var exam = ExamData(
        className: ClassName(name: cubit.classNameController.text, stdList: []),
        examName: cubit.examNameController.text,
        subjectName: cubit.subjectNameController.text,
        examType: type,
        iMark: iMark,
        numQuestions: num,
        qMark: mark,
        examDate: cubit.selectedDate == null ? DateTime.now() : DateTime.now(),
        selectedAnswers: [],
        students: [],
      );
      cubit.addExam(exam);
      context.pushNamed(Routes.homeScreen);
    }
  }
}
