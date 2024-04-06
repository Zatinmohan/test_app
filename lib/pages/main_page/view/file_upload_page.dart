import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/gen/assets.gen.dart';
import 'package:test_app/pages/main_page/view/states/image_picker_notifier.dart';
import 'package:test_app/pages/main_page/view/states/image_picker_states.dart';
import 'package:test_app/pages/main_page/view/widgets/custom_dotted_borders.dart';
import 'package:test_app/utils/color_constants.dart';
import 'package:test_app/utils/utilities.dart';

part '../view/widgets/image_view_widget.dart';
part 'widgets/custom_buttons.dart';

class FileUploadPage extends StatefulWidget {
  const FileUploadPage({super.key});

  @override
  State<FileUploadPage> createState() => _FileUploadPageState();
}

class _FileUploadPageState extends State<FileUploadPage> {
  File? currentImage;

  void _onViewPressed(
    AsyncValue<ImagePickerState> currentState,
    WidgetRef ref,
  ) {
    currentState.value?.mapOrNull(initial: (value) {
      Utilities.showSnackbar(
        context: context,
        message: "Upload an image first to continue",
      );
    }, loading: (value) {
      Utilities.showSnackbar(
        context: context,
        message: "Image is being uploaded, Please wait",
      );
    }, success: (data) {
      if (data.imagePath == null) {
        Utilities.showSnackbar(
          context: context,
          message: "No Image Picked",
        );
      } else {
        ref.read(imagePickerProvider.notifier).setImagePath(data.imagePath);
      }
    }, showImage: (value) {
      if (value.imagePath == currentImage) {
        Utilities.showSnackbar(
          context: context,
          message:
              "Already Viewing the same image. Please choose a diffent image",
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12.0),
          child: Consumer(builder: (context, ref, child) {
            ref.watch(imagePickerProvider);
            ref.listen(imagePickerProvider, (previous, next) {
              if (next.hasError) {
                Utilities.showSnackbar(
                  context: context,
                  message: next.error.toString(),
                );
              } else {
                next.value?.mapOrNull(
                  success: (data) {
                    if (data.imagePath != null) {
                      Utilities.showSnackbar(
                        context: context,
                        message: "Successfully Uploaded",
                      );
                      // Use this if new image uploaded successfully
                      //_currentImage = null;
                    }
                  },
                  showImage: (value) {
                    if (previous != next) {
                      currentImage = value.imagePath;
                    }
                  },
                );
              }
            });
            return Column(
              children: [
                Expanded(
                  flex: 4,
                  child: FileImageViewWidget(
                    titleText: "Upload Image",
                    imagePath: currentImage,
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButtons(
                        buttonColor: ColorConstants.kPrimaryColor,
                        buttonName: "Upload",
                        titleColor: Colors.white,
                        onTap: () async {
                          await ref
                              .read(imagePickerProvider.notifier)
                              .pickImage();
                        },
                      ),
                      CustomButtons(
                        buttonColor: Colors.grey.shade300,
                        buttonName: "View",
                        titleColor: Colors.black,
                        onTap: () {
                          final image = ref.read(imagePickerProvider);
                          if (image.hasError) {
                            Utilities.showSnackbar(
                              context: context,
                              message: image.error.toString(),
                            );
                          } else {
                            _onViewPressed(image, ref);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
