import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'image_picker_states.freezed.dart';

@freezed
class ImagePickerState with _$ImagePickerState {
  const factory ImagePickerState.initial() = _Initial;
  const factory ImagePickerState.loading() = _Loading;
  const factory ImagePickerState.success({File? imagePath}) = _Success;
  const factory ImagePickerState.showImage({File? imagePath}) = _ShowImage;
}
