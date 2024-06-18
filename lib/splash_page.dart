import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:greenapp/router/router.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class SplashPage extends StatefulHookConsumerWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  @override
  Widget build(BuildContext context) {
    useEffect(
      () {
        FlutterNativeSplash.remove();

        Future.delayed(const Duration(seconds: 1), () async {
          if (FirebaseAuth.instance.currentUser == null) {
            if (context.mounted) context.replaceRoute(const LoginRoute());
            return;
          } else {
            if (context.mounted) context.replaceRoute(const HomeRoute());
            return;
          }
        });

        return null;
      },
      [],
    );

    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("SplashScreen"),
        ],
      ),
    );
  }
}
