import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omr/core/routing/app_router.dart';
import 'package:omr/omr_app.dart';

void main() async {
  // setupGetIt();
  // To fix text being hidden bug in flutter_screenutil in release mode.
  await ScreenUtil.ensureScreenSize();
  runApp(OmrApp(
    appRouter: AppRouter(),
  ));
}
