// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:omr/core/helpers/spacing.dart';
import 'package:omr/core/theming/colors.dart';

// ignore: must_be_immutable
class ExamManageMentItem extends StatelessWidget {
  IconData icon;
  String lable;
  void Function()? onTap;

  ExamManageMentItem({
    super.key,
    required this.icon,
    required this.lable,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 60.h,
            width: 60.w,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[200]!,
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Icon(
                icon,
                color: ColorsManager.mainBlue,
              ),
            ),
          ),
          verticalSpace(10),
          Text(lable),
        ],
      ),
    );
  }
}
