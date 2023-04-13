import 'package:fluent_ui/fluent_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyData extends StatelessWidget {
  const EmptyData({super.key, this.message = 'Sua lista está vazia',
  this.messageColor = Colors.grey});

  final String? message;
  final Color messageColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
           FittedBox(
            fit: BoxFit.cover,
            child: Icon(FontAwesomeIcons.solidThumbsDown, color: Colors.grey[130], size: 60,),
          ),
          const SizedBox(height: 10,),
          FittedBox(
              fit: BoxFit.cover,
              child: Text(
                message!,
                style: GoogleFonts.montserrat(color: messageColor),
              )),
         const Spacer(),
        ],
      ),
    );
  }
}
