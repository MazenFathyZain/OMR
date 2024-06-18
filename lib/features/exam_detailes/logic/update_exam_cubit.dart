
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omr/core/models/exam_data.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class UpdateExamCubit extends Cubit<List<ExamData>> {
  UpdateExamCubit() : super([]);

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/exam_data.txt');
  }
}
