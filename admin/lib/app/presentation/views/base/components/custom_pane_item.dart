import 'package:fluent_ui/fluent_ui.dart';

class CustomPaneItem {
  static PaneItem show(
      {required Widget child,
      required String title,
      required Widget icon,
      required int index}) {
    return PaneItem(
      selectedTileColor:
          ButtonState.all(const Color(0xffB0E0E6).withOpacity(0.5)),
      icon: const Icon(FluentIcons.people),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      body: SizedBox.shrink(
        child: child,
      ),
    );
  }
}
