import 'package:fluent_ui/fluent_ui.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomFormHeader extends StatelessWidget {
  const CustomFormHeader({super.key, required this.title});
   final String title;


  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Text(title.toUpperCase(),
            style: GoogleFonts.montserrat(
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),),
            const Spacer(),
            ],
        ),
      );
  }
}