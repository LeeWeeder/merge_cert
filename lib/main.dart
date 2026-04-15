import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:merge_cert/routing/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());

  doWhenWindowReady(() {
    const initialSize = Size(1280, 720);
    appWindow.minSize = initialSize;
    appWindow.size = initialSize;
    appWindow.show();
  });
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        return MaterialApp.router(
          routerConfig: router(),
          theme: ThemeData(colorScheme: lightDynamic),
          darkTheme: ThemeData(colorScheme: darkDynamic),
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            return Column(
              children: [
                WindowTitleBarBox(
                  child: ColoredBox(
                    color: Theme.of(context).colorScheme.surface,
                    child: Row(
                      children: [
                        Expanded(child: MoveWindow()),
                        WindowButtons(),
                      ],
                    ),
                  ),
                ),
                Expanded(child: child ?? const SizedBox()),
              ],
            );
          },
        );
      },
    );
  }
}

class WindowButtons extends StatelessWidget {
  const WindowButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final windowButtonColors = WindowButtonColors(
      iconNormal: Theme.of(context).colorScheme.onSurface,
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        MinimizeWindowButton(colors: windowButtonColors),
        appWindow.isMaximized
            ? RestoreWindowButton(colors: windowButtonColors)
            : MaximizeWindowButton(colors: windowButtonColors),
        CloseWindowButton(colors: windowButtonColors),
      ],
    );
  }
}
