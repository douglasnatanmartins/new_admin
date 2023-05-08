import 'package:admin/app/presentation/widgets/custom_dialogs/custom_alert_willpop.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomRowButtonSave extends StatelessWidget {
  const CustomRowButtonSave({
    super.key,
    required this.width,
    this.onPressed,
    this.padding = const EdgeInsets.only(left: 10, top: 20, right: 40),
  });

  final double width;
  final Function()? onPressed;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FilledButton(
              style: ButtonStyle(
                  padding: ButtonState.all(
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 30))),
              onPressed: onPressed,
              child:
                  Text('Salvar', style: GoogleFonts.montserrat(fontSize: 16))),
          const SizedBox(width: 40),
          /*===============================
            Botão Cancelar com Validação
          ================================*/
          Button(
            style: ButtonStyle(
                padding: ButtonState.all(
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 30))),
            child:
                Text('Cancelar', style: GoogleFonts.montserrat(fontSize: 16)),
            onPressed: () {
              CustomAlertWillPop.show(context: context);
            },
          ),
        ],
      ),
    );
  }
}
