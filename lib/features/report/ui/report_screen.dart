import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omr/core/helpers/extension.dart';
import 'package:omr/core/models/exam_data.dart';
import 'package:omr/core/routing/routes.dart';
import 'package:omr/core/theming/colors.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ExamData exam =
        ModalRoute.of(context)?.settings.arguments as ExamData;
    var data = exam.students!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Students Report',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 19.sp,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.7,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 20.0.h),
        child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  GestureDetector(
                    onTap: () => context.pushNamed(
                      Routes.reportDetailesScreen,
                      arguments: data[index],
                    ),
                    child: ListTile(
                      leading: Container(
                        height: 50.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: ColorsManager.lightBlue,
                        ),
                        child: Center(
                          child: Text(
                            data[index].stdName.toString().substring(0, 1),
                            style: TextStyle(
                              color: ColorsManager.mainBlue,
                              fontSize: 18.sp,
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        data[index].stdName.toString(),
                        style: TextStyle(
                          fontSize: 19.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(data[index].stdId.toString()),
                      trailing: Text(
                        '20',
                        style: TextStyle(
                          color: ColorsManager.grey,
                          fontSize: 19.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
