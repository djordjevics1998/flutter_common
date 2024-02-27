import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'dart:js' as js;

import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

void shareText(BuildContext context, String text, {String? clipboardText}) {
  if (_canUseWebShare()) {
    FutureOr<Null> onErrorCallback(Object? error, StackTrace stackTrace) {
      _setClipboard(context, text, clipboardText);
    }
      if (kIsWeb) {
        final data = {
          'text': text,
        };
        html.window.navigator.share(data).then((val) {
          // Sharing successful
          //print('Shared successfully');
        }).onError(onErrorCallback);
      }
      else {
        Share.share(text).onError(onErrorCallback);
      }
    }
  else {
    _setClipboard(context, text, clipboardText);
  }
}

void _setClipboard(BuildContext context, String text, String? clipboardText) =>
  Clipboard.setData(
      ClipboardData(text: text))
      .then((_) {
        if(clipboardText != null) _showClipboard(context, clipboardText);
  });

void _showClipboard(BuildContext context, String clipboardText) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(clipboardText)));

bool _canUseWebShare() {
  try {
    final js.JsObject navigator = js.context['navigator'] as js.JsObject;
    return navigator.hasProperty('canShare');
  } catch (e) {
    return false;
  }
}