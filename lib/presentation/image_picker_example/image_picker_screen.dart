import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_taj/bloc/imagePicker/image_picker_bloc.dart';
import 'package:bloc_taj/bloc/imagePicker/image_picker_event.dart';
import 'package:bloc_taj/bloc/imagePicker/image_picker_state.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Image Picker"),
            centerTitle: true,
            backgroundColor: Colors.blueAccent,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                BlocBuilder<ImagePickerBloc, ImagePickerState>(
                  builder: (context, state) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 450,
                        width: double.infinity,
                        color: state.file == null ? Colors.red : Colors.transparent,
                        child: state.file == null
                               ? Container()
                               : Image.file(File(state.file!.path.toString()),fit: BoxFit.cover,)
                               ,
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          context
                              .read<ImagePickerBloc>()
                              .add(const CameraImagePickerEvent());
                        },
                        child: const Text(
                          "Camera",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          context
                              .read<ImagePickerBloc>()
                              .add(const GalleryImagePickerEvent());
                        },
                        child: const Text("Gallery",
                            style:
                                TextStyle(color: Colors.black, fontSize: 20)))
                  ],
                )
              ],
            ),
          )),
    );
  }
}
