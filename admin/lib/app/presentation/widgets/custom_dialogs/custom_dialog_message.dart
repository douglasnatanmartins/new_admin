import 'dart:async';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as m;
import 'package:google_fonts/google_fonts.dart';

class CustomDialogMessage {
  static show(
      {required BuildContext context,
      required String message,
      int? typeTitle,
      bool btnOk = false,
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

    Color typeColor(int type) {
      if (type == 1) {
        return Colors.yellow.darkest;
      } else if (type == 2) {
        return Colors.blue;
      } else if (type == 3) {
        return Colors.green;
      } else {
        return Colors.red;
      }
    }

    Timer? timer;

    await m
        .showDialog(
            context: context,
            builder: (_) {
              timer = Timer(const Duration(seconds: 3), () {
                if(!btnOk) {
                  Navigator.of(context).pop();
                }
              });
              return ContentDialog(
                title: Text(typeConvert(typeTitle ?? 0),
                style: GoogleFonts.montserrat(
                  color: typeColor(typeTitle ?? 0),
                  fontWeight: FontWeight.bold,
                  
                ),),
                content: Text(message,
                style: GoogleFonts.roboto(
                  fontSize: 16,
                )),
                actions: btnOk
                      ? [
                          FilledButton(
                            child: Text('Entendido'.toUpperCase()),
                            onPressed: () => Navigator.of(context).pop(),
                          )
                        ]
                      : null
              );
            })
        .then((value) {
      if (timer!.isActive) {
        timer!.cancel();
      }
    });
  }
}
