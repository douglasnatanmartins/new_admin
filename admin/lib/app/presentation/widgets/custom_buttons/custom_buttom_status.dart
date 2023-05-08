import 'package:fluent_ui/fluent_ui.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButtonStatus extends StatelessWidget {
  const CustomButtonStatus({super.key, required this.checked, this.onChanged, this.width = 100});

  final bool checked;
  final Function(bool)? onChanged;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      width: width,
      child: Row(
        children: [
          Text(
            'Situação:',
            style: GoogleFonts.montserrat(fontWeight: FontWeight.w700),
          ),
          const SizedBox(width: 5),
          ToggleSwitch(
            checked: checked,
            onChanged: onChanged,
            content: Text(
              checked ? 'Ativo' : 'Inativo',
              style: GoogleFonts.montserrat(
                  color: checked ? Colors.grey : Colors.red.darker,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}
