import '../generated/app_localizations.dart';
import 'package:flutter/material.dart';

Future<void> showErrorDialog(BuildContext context, String message, {void Function()? onPressed}) async => _showMessageDialog(context, message, _MessageType.errorMessage, onPressed);
Future<void> showConfirmationDialog(BuildContext context, String message, {void Function()? onPressed}) async => _showMessageDialog(context, message, _MessageType.confirmationMessage, onPressed);
Future<void> showSuccessDialog(BuildContext context, String message, {void Function()? onPressed}) async => _showMessageDialog(context, message, _MessageType.successMessage, onPressed);

enum _MessageType {
  errorMessage,
  successMessage,
  confirmationMessage,
}

Future<void> _showMessageDialog(BuildContext context, String message, _MessageType messageType, void Function()? onPressed) async => showDialog<bool>(context: context,
    builder: (context) => AlertDialog(title: Text(
      messageType == _MessageType.errorMessage ?
      FlutterCommonLocalizations.of(context)!.error_title : messageType == _MessageType.confirmationMessage ? FlutterCommonLocalizations.of(context)!.confirm_title : FlutterCommonLocalizations.of(context)!.success_title,
      style: TextStyle(color: messageType == _MessageType.errorMessage ? Theme.of(context).colorScheme.error : messageType == _MessageType.confirmationMessage ? Theme.of(context).colorScheme.tertiary : Theme.of(context).colorScheme.primary),
    ), content: SingleChildScrollView(
      child: ListBody(
        children: [
          Text(message),
        ],
      ),
    ),
      actions: [
        TextButton(onPressed: () {
          Navigator.of(context).pop(true);
        }, child: Text(FlutterCommonLocalizations.of(context)!.okay)),
        if(messageType == _MessageType.confirmationMessage) TextButton(onPressed: () {
          Navigator.of(context).pop(false);
        }, child: Text(FlutterCommonLocalizations.of(context)!.cancel)),
      ],
    ))..then((value) => onPressed == null || value == null || !value ? 1 : onPressed());