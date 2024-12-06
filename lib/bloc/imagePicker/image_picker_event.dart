
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerEvent extends Equatable{
  const ImagePickerEvent();
  @override
  List<Object?> get props => [];
}

class CameraImagePickerEvent extends ImagePickerEvent{
   const CameraImagePickerEvent();
}
class GalleryImagePickerEvent extends ImagePickerEvent{
  const GalleryImagePickerEvent();
}
