import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omr/core/routing/routes.dart';
import 'package:omr/features/add_exam/ui/add_exam_screen.dart';
import 'package:omr/features/add_exam/logic/exam_cubit.dart';
import 'package:omr/features/asnwers/ui/answers_screen.dart';
import 'package:omr/features/exam_detailes/ui/exam_detailes_screen.dart';
import 'package:omr/features/home/home_screen.dart';
import 'package:omr/features/exam_detailes/logic/image_cubit.dart';
import 'package:omr/features/report/ui/report_screen.dart';
import 'package:omr/features/report_detailes/ui/report_detailes_screen.dart';

class AppRouter {
  Route? generateRout(RouteSettings settings) {
    // ignore: unused_local_variable
    final argument = settings.arguments;
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => ExamCubit()..loadExamData(),
              ),
              BlocProvider(
                create: (context) => ImageCubit(),
              ),
            ],
            child: const HomeScreen(),
          ),
        );
      case Routes.addExamScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ExamCubit(),
            child: const AddExamScreen(),
          ),
        );
      case Routes.examDetailesScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => ImageCubit(),
              ),
              BlocProvider(
                create: (context) => ExamCubit(),
              ),
            ],
            child: const ExamDetailesScreen(),
          ),
          settings: settings,
        );
      case Routes.answersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ExamCubit(),
            child: const AnswersScreen(),
          ),
          settings: settings,
        );
      case Routes.reportScreen:
        return MaterialPageRoute(
          builder: (_) => const ReportScreen(),
          settings: settings,
        );
      case Routes.reportDetailesScreen:
        return MaterialPageRoute(
          builder: (_) => const ReportDetailesScreen(),
          settings: settings,
        );

      default:
        return null;
    }
  }
}
