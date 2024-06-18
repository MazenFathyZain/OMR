import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';

class ImageCubit extends Cubit<String?> {
  ImageCubit() : super(null);

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      final imageFile = File(pickedFile.path);
      final base64Image = base64Encode(imageFile.readAsBytesSync());
      emit(base64Image);
    } else {
      emit(null);
    }
  }
}
