import 'package:auto_route/auto_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:latlong2/latlong.dart';

import 'constants/constant.dart';
import 'constants/screensize.dart';
import 'core/injections/locator.dart';
import 'features/firebase_options.dart';
import 'router/router.dart';
import 'theme/light_theme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

String currentCategory = '';
LatLng currentlocation = LatLng(39.782499, 30.510203);
String makinaId = '';

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await configureDependencies();
  await dotenv.load(fileName: ".env");
  Gemini.init(apiKey: dotenv.env['GeminiAPikey'].toString());
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: designSize,
      builder: (context, child) => GestureDetector(
        onTap: () => unfocus(context),
        child: const _MaterialApp(),
      ),
    );
  }

  void unfocus(BuildContext context) {
    final currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}

class _MaterialApp extends ConsumerStatefulWidget {
  const _MaterialApp();

  @override
  ConsumerState<_MaterialApp> createState() => __MaterialAppState();
}

class __MaterialAppState extends ConsumerState<_MaterialApp> {
  final _appRouter = getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: AutoRouterDelegate(
        _appRouter,
        navigatorObservers: () => [AutoRouteObserver()],
      ),
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: lightTheme,
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context)
            .copyWith(textScaler: TextScaler.noScaling, boldText: false),
        child: child!,
      ),
    );
  }
}
