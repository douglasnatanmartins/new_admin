import 'package:fluent_ui/fluent_ui.dart';
import 'package:google_fonts/google_fonts.dart';

class CutsomPaneItemHeader {
  static PaneItemHeader customPaneItem({required String title}) {
    return PaneItemHeader(
        header: Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Text(
              title,
              style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, color: Colors.grey[50]),
            ),
        ));
  }
}
