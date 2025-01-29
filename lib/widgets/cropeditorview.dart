import 'dart:typed_data';
import 'package:crop_your_image/crop_your_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common/generated/app_localizations.dart';

class CropEditorWidget extends StatefulWidget {
  final Uint8List image;
  final double aspectRatio;
  final bool withCircleUi;
  final void Function(CropResult result) onCropped;
  final void Function() onCanceled;
  //final _cropController = CropController();

  const CropEditorWidget(
      {super.key,
        required this.image, this.aspectRatio = 1,
        required this.onCropped,
        required this.onCanceled, this.withCircleUi = false});

  @override
  State<CropEditorWidget> createState() => _CropEditorWidgetState();
}

class _CropEditorWidgetState extends State<CropEditorWidget> {
  final _cropController = CropController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Crop(
              image: widget.image,
              controller: _cropController,
              onCropped: widget.onCropped,
              aspectRatio: widget.aspectRatio,
              withCircleUi: widget.withCircleUi,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Theme.of(context).colorScheme.onPrimary,
                    shape: const BeveledRectangleBorder(
                    ),
                  ),
                  onPressed: () async {
                    widget.withCircleUi ? _cropController.cropCircle() : _cropController.crop();
                  },
                  child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(FlutterCommonLocalizations.of(context)!.choose)),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.error,
                      foregroundColor: Theme.of(context).colorScheme.onError,
                      shape: const BeveledRectangleBorder(
                      ),
                    ),
                    onPressed: widget.onCanceled,
                    child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(FlutterCommonLocalizations.of(context)!.cancel))
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

