import 'package:fluent_ui/fluent_ui.dart';
import 'package:google_fonts/google_fonts.dart';

class ConstTextForm extends StatelessWidget {
  const ConstTextForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Text('Os campos com (*) são de preenchimento obrigatórios',
          style: GoogleFonts.montserrat(color: Colors.red)),
    );
  }
}
