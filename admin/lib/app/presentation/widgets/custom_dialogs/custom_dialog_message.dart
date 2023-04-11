import 'package:fluent_ui/fluent_ui.dart';

class CustomDialogMessage {
  static show({required BuildContext context, required String message, int? typeTitle,
      String? btnOk, String? btnCancel, Function()? onPressed}) async {
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

    await showDialog(
        context: context,
        builder: (_) => ContentDialog(
              title: Text(typeConvert(typeTitle ?? 0)),
              content: Text(message),
              actions: [
                typeTitle != 0 ?
                Button(
                  onPressed: onPressed ?? () {
                    Navigator.pop(context);
                  },
                  child: Text(btnOk ?? 'Entendido'),
                ) : Container(),
                FilledButton(
                  child: Text(typeTitle == 0 ? 'Entendido': btnCancel ?? 'Cancelar'),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ));
  }
}
