import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omr/core/models/exam_data.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class ExamCubit extends Cubit<List<ExamData>> {
  ExamCubit() : super([]) {
    loadExamData();
  }

  TextEditingController subjectNameController = TextEditingController();
  TextEditingController classNameController = TextEditingController();
  TextEditingController examNameController = TextEditingController();
  TextEditingController examTypeController = TextEditingController();
  DateTime? selectedDate;

  final formKey = GlobalKey<FormState>();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      emit(state);
    }
  }

  Future<void> addExam(ExamData exam) async {
    final currentExams = List<ExamData>.from(state)..add(exam);
    // final currentState = await _loadCurrentState();
    // currentExams.add(exam);
    emit(currentExams);
    await _saveExamsToFile(currentExams);
    // emit(currentExams);
  }

  Future<void> removeExam(ExamData exam) async {
    final currentExams = List<ExamData>.from(state);
    currentExams.remove(exam);
    await _saveExamsToFile(currentExams);
    emit(currentExams);
  }

  Future<List<ExamData>> _loadCurrentState() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/exams.txt');
    if (file.existsSync()) {
      final contents = await file.readAsString();
      final List<dynamic> jsonData = jsonDecode(contents);
      return jsonData.map((data) => ExamData.fromJson(data)).toList();
    } else {
      return [];
    }
  }

  Future<void> loadExamData() async {
    try {
      // Load existing data from the file
      final currentState = await _loadCurrentState();

      // Emit the loaded data
      emit(currentState);
    } catch (e) {
      // In case of error, emit an empty list
      emit([]);
    }
  }

  Future<void> _saveExamsToFile(List<ExamData> exams) async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/exams.txt');
    final jsonExams = jsonEncode(exams.map((e) => e.toJson()).toList());
    await file.writeAsString(jsonExams);
  }

  Future<void> addOrUpdateExamData(ExamData newData) async {
    try {
      List<ExamData> currentList = List.from(state);
      int index = currentList
          .indexWhere((element) => element.examName == newData.examName);

      if (index != -1) {
        // Update existing exam data
        currentList[index] = newData;
        print('UPDATE');
      } else {
        print('UPDATE');
        // Add new exam data
        currentList.add(newData);
      }

      // Convert the list back to JSON
      List<Map<String, dynamic>> jsonListUpdated =
          currentList.map((item) => item.toJson()).toList();
      String jsonStringUpdated = jsonEncode(jsonListUpdated);

      // Write updated data back to the file
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/exams.txt');
      await file.writeAsString(jsonStringUpdated);

      // Update state
      emit(currentList);
    } catch (e) {
      // Handle errors
      emit([]);
    }
  }
}
