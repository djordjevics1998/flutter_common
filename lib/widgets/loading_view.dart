import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  final Color? color, textColor;
  final String? text;

  const LoadingView({super.key, this.color, this.textColor, this.text});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.8,
          child: ModalBarrier(dismissible: false, color: color ?? Theme.of(context).colorScheme.onPrimary),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(color: textColor ?? Theme.of(context).colorScheme.primary,),
                if (text != null) ...[
                  const SizedBox(height: 5,),
                  Text(
                    text!,
                    style: TextStyle(
                        color: textColor ?? Theme.of(context).colorScheme.primary),
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
