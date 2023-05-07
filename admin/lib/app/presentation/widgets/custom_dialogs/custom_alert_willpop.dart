import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as m;

class CustomAlertWillPop {

  static show({required BuildContext context, String? desc}) {
    return m.showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return ContentDialog(
          title: const Text('Confirmar fechamento'),
          content: const Text('Ao retornar todas as informações não salvas serão perdidas!'
          ' Deseja mesmo Retornar..!!!'),
          actions: [
            FilledButton(
              child: const Text('Sim'),
              onPressed: () async {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
            Button(
              child: const Text('Não'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  static showRecalcFrete({required BuildContext context, String? desc}) {
   /* return Alert(
        context: context,
        type: AlertType.warning,
        title: 'ALERTA! Não Deseja Recalcular o tudo?',
        content: SizedBox(
          width: MediaQuery.of(context).size.width / 2,
          child: const Text(
              'Pois ao não recalcular corre risco de inconsistencias de informações,'
              'porém se tudo já foi recalculado é só clicar em ( NÃO )'),
        ),
        buttons: [
          DialogButton(
            onPressed: () => Navigator.of(context).pop(true),
            color: Colors.blue,
            child: const Text(
              'Não',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          DialogButton(
              onPressed: () => Navigator.of(context).pop(false),
              color: Colors.yellow.shade800,
              child: Text(
                'Sim Recalcular',
                style: TextStyle(color: Colors.grey.shade50, fontSize: 20),
              )),
        ]).show();
        */
  }


 
}