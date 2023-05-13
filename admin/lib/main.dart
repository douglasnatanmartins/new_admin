import 'package:admin/app/core/config/injectors/injectors.dart';
import 'package:admin/app/presentation/views/home/home_view.dart';
import 'package:admin/app/presentation/views/login/login_view.dart';
import 'package:admin/app/presentation/views/splash/splash_view.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_acrylic/window.dart' as flutter_acrylic;
import 'package:google_fonts/google_fonts.dart';
import 'package:window_manager/window_manager.dart';

import 'app/presentation/views/base/base_layout.dart';


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
            scaffoldBackgroundColor: Colors.grey[30],
            visualDensity: VisualDensity.standard,
            cardColor: const Color(0xFFFFFFFF),
            navigationPaneTheme: NavigationPaneThemeData(
              animationCurve: Curves.bounceOut,
              animationDuration: Duration.zero,
              backgroundColor: const Color(0XFF171e29),
             selectedTextStyle:ButtonState.all(GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              color: Colors.grey[10]
             )),
             unselectedTextStyle:ButtonState.all(GoogleFonts.montserrat(
              color: Colors.grey[80]
             )),
            )
          ),
          onGenerateRoute: (settings){
            switch(settings.name){
              case '/base':
              return FluentPageRoute(builder: (_) => BaseLayout());
              case '/home':
              return FluentPageRoute(builder: (_) => HomeView());
              case '/login':
              return FluentPageRoute(builder: (_) => LoginView());
              default:
              return FluentPageRoute(builder: (_) => const SplashView());
            }
          },
          
        );
      }
}