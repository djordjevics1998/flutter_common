import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  final Color? backgroundColor, foregroundColor;
  final String? text;
  final double opacity;

  const LoadingView({super.key, this.backgroundColor, this.foregroundColor, this.text, this.opacity = 0.8});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: opacity,
          child: ModalBarrier(dismissible: false, color: backgroundColor ?? Theme.of(context).colorScheme.surface),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(color: foregroundColor ?? Theme.of(context).colorScheme.onSurface,),
                if (text != null) ...[
                  const SizedBox(height: 5,),
                  Text(
                    text!,
                    style: TextStyle(
                        color: foregroundColor ?? Theme.of(context).colorScheme.onSurface),
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
