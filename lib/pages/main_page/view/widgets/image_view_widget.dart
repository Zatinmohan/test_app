part of '../file_upload_page.dart';

class FileImageViewWidget extends StatelessWidget {
  final String titleText;
  final File? imagePath;
  const FileImageViewWidget({
    super.key,
    required this.titleText,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.sizeOf(context).width;
    return Column(
      children: [
        const SizedBox(height: 8.0),
        Text(
          titleText,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: size * 0.08,
              ),
        ),
        const SizedBox(height: 8.0),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.maxFinite,
              child: CustomPaint(
                painter: DottedBorderPainter(
                  strokeWidth: 1,
                  dottedLineColor: Colors.black,
                ),
                child: imagePath == null
                    ? Assets.images.uploadImage.image(
                        scale: 2.0,
                      )
                    : Image.file(imagePath!),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
