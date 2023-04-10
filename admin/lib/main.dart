import 'package:admin/app/core/config/injectors.dart';
import 'package:admin/app/presentation/views/login/login_view.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_acrylic/window.dart' as flutter_acrylic;
import 'package:window_manager/window_manager.dart';


bool get isDesktop {
  if (kIsWeb) return false;
  return [
    TargetPlatform.windows,
    TargetPlatform.linux,
    TargetPlatform.macOS,
  ].contains(defaultTargetPlatform);
}


Future<void> main() async {
 // await Config().onInit();
 // configurationsLoading();
  if (!kIsWeb &&
      [
        TargetPlatform.windows,
        TargetPlatform.android,
      ].contains(defaultTargetPlatform)) {
      SystemUiOverlayStyle.dark;
  }

  if (isDesktop) {
    WidgetsFlutterBinding.ensureInitialized();
    await flutter_acrylic.Window.initialize();
    await WindowManager.instance.ensureInitialized();

    windowManager.waitUntilReadyToShow().then((_) async {
      await windowManager.setTitleBarStyle(
        'windows',
        windowButtonVisibility: false,
      );
      await windowManager.setMinimumSize(const Size(950, 650));
      await windowManager.isFullScreen();
      await windowManager.setPreventClose(true);
      await windowManager.setSkipTaskbar(false);
      windowManager.show();
    });
  }

  Injectors().setupLocators();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return FluentApp(
          title: 'Gestor',
          
          themeMode: ThemeMode.dark,
          debugShowCheckedModeBanner: false,
          color: const Color(0xff268cda),
          locale: const Locale('pt', 'BR'),
          theme: FluentThemeData(
            //accentColor: SystemTheme.accentColor.accent.toAccentColor(),
            scaffoldBackgroundColor: const Color(0xff268cda),
            cardColor: const Color(0xFFFFFFFF),
          ),
          onGenerateRoute: (settings){
            switch(settings.name){
              default:
              return FluentPageRoute(builder: (_) => const LoginView());
            }
          },
          
        );
      }
}