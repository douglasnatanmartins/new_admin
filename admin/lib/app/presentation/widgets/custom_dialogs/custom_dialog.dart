import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as m;
import 'package:google_fonts/google_fonts.dart';

class CustomDialog {
 static loading({required BuildContext context, String? title}) {
    showDialog(
      barrierDismissible: false,
        context: context,
        builder: (_) => m.Dialog(
          child: SizedBox(
            height: MediaQuery.of(context).size.width / 10,
            width: MediaQuery.of(context).size.width / 6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 10),
                const Center(child: m.CircularProgressIndicator(),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(title ?? 'Salvando...',
                  style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 16),),
                ),
              ],
            )
          ),
        )
      );
  }

  static dismiss(BuildContext context) {
    Navigator.of(context).pop();
  }
}
