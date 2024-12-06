import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:bloc_taj/bloc/imagePicker/image_picker_event.dart';
import 'package:bloc_taj/bloc/imagePicker/image_picker_state.dart';
import 'package:bloc_taj/utils/imagePicker_utils.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePickerUtils imagePickerUtils;

  ImagePickerBloc(this.imagePickerUtils) : super(const ImagePickerState()) {
    on<CameraImagePickerEvent>(_cameraImage);
    on<GalleryImagePickerEvent>(_galleryImage);
  }

  void _cameraImage(CameraImagePickerEvent event, Emitter<ImagePickerState> emit) async{
    XFile? file = await imagePickerUtils.cameraImage();
    emit(state.copyWith(file: file));
  }

  void _galleryImage( GalleryImagePickerEvent event, Emitter<ImagePickerState> emit)async {

    XFile? file = await imagePickerUtils.galleryImage();
    emit(state.copyWith(file: file));
  }
}
