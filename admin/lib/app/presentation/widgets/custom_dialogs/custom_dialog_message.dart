import 'dart:async';

import 'package:fluent_ui/fluent_ui.dart';

class CustomDialogMessage {
  static show(
      {required BuildContext context,
      required String message,
      int? typeTitle,
      String? btnOk,
      String? btnCancel,
      Function()? onPressed}) async {
    typeTitle ??= 0;

    String typeConvert(int type) {
      if (type == 1) {
        return 'ALERTA!';
      } else if (type == 2) {
        return 'INFO!';
      } else if (type == 3) {
        return 'SUCESSO!';
      } else {
        return 'ERROR';
      }
    }

    Timer? timer;

    await showDialog(
        context: context,
        builder: (_) {
          timer = Timer(const Duration(seconds: 3), () {
            Navigator.of(context).pop();
          });
          return ContentDialog(
            title: Text(typeConvert(typeTitle ?? 0)),
            content: Text(message),
          );
        }).then((value) {
      if (timer!.isActive) {
        timer!.cancel();
      }
    });
  }
}
