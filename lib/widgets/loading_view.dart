import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final Color color;
  final String? text;

  const LoadingWidget({super.key, this.color = Colors.black, this.text});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.8,
          child: ModalBarrier(dismissible: false, color: color),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                if (text != null) ...[
                  const SizedBox(height: 5,),
                  Text(
                    text!,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary),
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
