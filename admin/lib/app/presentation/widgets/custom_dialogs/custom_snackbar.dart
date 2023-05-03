import 'package:fluent_ui/fluent_ui.dart';

class CustomSnackbar {
  
  static Future<void> show(
      {required BuildContext cxt,
      required String message,
      Function()? onPressed,
      InfoBarSeverity? severity = InfoBarSeverity.error}) async {
    String convertInfoBar(InfoBarSeverity severity) {
      if (severity == InfoBarSeverity.error) {
        return 'ERRO';
      } else if (severity == InfoBarSeverity.info) {
        return 'INFO!';
      } else if (severity == InfoBarSeverity.warning) {
        return 'ALERTA!';
      } else {
        return 'SUCESSO';
      }
    }

    if (cxt == null || message == null || severity == null) return;


     var info = await displayInfoBar(cxt, builder: (context, close) {
      return InfoBar(
        title: Text(convertInfoBar(severity)),
        content: Text(message),
        isLong: true,
        isIconVisible: true,
        severity: severity,
        onClose: close,
      );
    }); 
  }
}
