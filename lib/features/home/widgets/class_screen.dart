import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omr/core/models/exam_data.dart';
import 'package:omr/features/add_exam/logic/exam_cubit.dart';

class ClassScreen extends StatelessWidget {
  const ClassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExamCubit, List<ExamData>>(builder: (context, data) {
      if (data.isEmpty) {
        return const Center(child: Text('No data available.'));
      }
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Card(
                color: const Color(0xffeaf2fd),
                child: ListTile(
                  leading: const Icon(Icons.people),
                  title: Text(data[index].className.toString()),
                ),
              );
            }),
      );
    });
  }
}
