import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omr/core/helpers/spacing.dart';
import 'package:omr/core/models/exam_data.dart';
import 'package:omr/core/theming/colors.dart';

class ReportDetailesScreen extends StatelessWidget {
  const ReportDetailesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Student student =
        ModalRoute.of(context)?.settings.arguments as Student;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          student.stdId!,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 19.sp,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.7,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Name',
                    style: TextStyle(fontSize: 18.sp, color: Colors.grey[700]),
                  ),
                  horizontalSpace(60.0.w),
                  Text(
                    student.stdName.toString(),
                    style: TextStyle(fontSize: 18.sp, color: Colors.grey[700]),
                  ),
                ],
              ),
              verticalSpace(20.0.h),
              Row(
                children: [
                  Text(
                    'Class',
                    style: TextStyle(fontSize: 18.sp, color: Colors.grey[700]),
                  ),
                  horizontalSpace(60.0.w),
                  Text(
                    student.stdId.toString(),
                    style: TextStyle(fontSize: 18.sp, color: Colors.grey[700]),
                  ),
                ],
              ),
              verticalSpace(20.0.h),
              Row(
                children: [
                  Text(
                    'Exam',
                    style: TextStyle(fontSize: 18.sp, color: Colors.grey[700]),
                  ),
                  horizontalSpace(60.0.w),
                  Text(
                    'sdada',
                    style: TextStyle(fontSize: 18.sp, color: Colors.grey[700]),
                  ),
                ],
              ),
              verticalSpace(40.0.h),
              Table(
                border: TableBorder.all(
                  color: Colors.grey[300]!,
                ),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  const TableRow(
                    decoration: BoxDecoration(
                      color: ColorsManager.mainBlue,
                    ),
                    children: [
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Q No',
                            style: TextStyle(color: Colors.white),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Attempted',
                            style: TextStyle(color: Colors.white),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Correct',
                            style: TextStyle(color: Colors.white),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Marks',
                            style: TextStyle(color: Colors.white),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ...List.generate(
                    30,
                    (index) => TableRow(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      children: [
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Q ${index + 1}'),
                          ),
                        ),
                        const TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(''),
                          ),
                        ),
                        const TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('true'),
                          ),
                        ),
                        const TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('1'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
