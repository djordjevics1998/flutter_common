import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  final Color? backgroundColor, foregroundColor;
  final String? text;

  const LoadingView({super.key, this.backgroundColor, this.foregroundColor, this.text});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.8,
          child: ModalBarrier(dismissible: false, color: backgroundColor ?? Theme.of(context).colorScheme.onPrimary),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(color: foregroundColor ?? Theme.of(context).colorScheme.primary,),
                if (text != null) ...[
                  const SizedBox(height: 5,),
                  Text(
                    text!,
                    style: TextStyle(
                        color: foregroundColor ?? Theme.of(context).colorScheme.primary),
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
