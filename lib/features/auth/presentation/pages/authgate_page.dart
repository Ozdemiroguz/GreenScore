import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:greenapp/features/home/presentation/pages/main_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/auth_provider.dart';
import 'login_page.dart';

@RoutePage()
class AuthGatePage extends ConsumerWidget {
  const AuthGatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //authproviderı dinle ve durumları yazdır
    //ref.listen(authProvider.select((value) => value.status),(previosu, current) => print("AuthState: $current"));

    return ref.watch(authProvider).status == false
        ? const LoginPage()
        : const MainPage();

    // return  Scaffold(
    //   body:Container
    //   (
    //     child: Center(child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Text("AuthGatePage"),
    //         SizedBox(
    //           height: 20,

    //         ),
    //         Text("AuthState: ${ref.watch(authProvider.select((value) => value.status))}"),
    //         SizedBox(
    //           height: 20,

    //         ),

    //         ElevatedButton(onPressed: (){
    //           ref.read(authProvider.notifier).signOut();
    //         }, child: Text("SignOut")),
    //         SizedBox(height: 20,),
    //         ElevatedButton(onPressed: (){
    //           ref.watch(loginProvider.notifier).testUserLogin();
    //           ref.watch(loginProvider.notifier).login();

    //         }, child: Text("SiginIn")),

    //       ],
    //     )),
    //   )
    // );
  }
}
