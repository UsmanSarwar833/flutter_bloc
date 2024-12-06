import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImagePickerUtils{

  final ImagePicker _picker = ImagePicker();
  File? selected;

  Future<XFile?> cameraImage()async{
    final XFile? file = await _picker.pickImage(source: ImageSource.camera);
    return file;
  }
  Future<XFile?> galleryImage()async{
    final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
    return file;
  }
}