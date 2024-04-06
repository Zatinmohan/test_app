import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/pages/main_page/view/states/image_picker_states.dart';

const String _logName = "Image Picker Notifier";

class ImagePickerNotifier extends AsyncNotifier<ImagePickerState> {
  @override
  FutureOr<ImagePickerState> build() {
    ref.onDispose(() {
      log("Image Picker Notifier Disposed", name: _logName);
    });
    return const ImagePickerState.initial();
  }

  ImagePickerNotifier() {
    log("Image Picker Notifier Init", name: _logName);
  }

  void setImagePath(File? file) {
    state = AsyncData(ImagePickerState.showImage(imagePath: file));
  }

  Future<void> pickImage() async {
    try {
      state = const AsyncData(ImagePickerState.loading());
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
      );
      if (result != null) {
        final String? filePath = result.files.single.path;
        if (filePath != null) {
          final File file = File(filePath);
          state = AsyncData(ImagePickerState.success(imagePath: file));
        } else {
          throw "Something went wrong";
        }
      } else {
        state = const AsyncData(ImagePickerState.success());
      }
    } catch (error) {
      state = AsyncError(error, StackTrace.current);
      rethrow;
    }
  }
}

final imagePickerProvider =
    AsyncNotifierProvider<ImagePickerNotifier, ImagePickerState>(
  ImagePickerNotifier.new,
);
