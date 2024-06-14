import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenapp/customs/custom_text_field.dart';
import 'package:greenapp/customs/password_text_field.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common.dart/overlay_wiget.dart';
import '../../../../constants/colors.dart';
import '../../../../core/models/status.dart';
import '../../../../customs/custom_button.dart';
import '../../../../router/router.dart';
import '../providers/login_provider.dart';

final _keyProvider = Provider.autoDispose((ref) => GlobalKey<FormState>());

@RoutePage()
class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: OverlayWidget(
        error: ref.watch(loginProvider).failure,
        status: ref.read(loginProvider).status,
        onTap: () {
          ref.read(loginProvider.notifier).resetStatus();
        },
        child: const LoginPageContent(),
      ),
    );
  }
}

class LoginPageContent extends ConsumerWidget {
  const LoginPageContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: SingleChildScrollView(
        padding:
            EdgeInsets.only(left: 20.w, right: 20.w, top: 40.h, bottom: 40.h),
        child: Form(
          key: ref.watch(_keyProvider),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.account_circle,
                size: 150.sp,
              ),
              Text(
                "Login",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 50.h),
              const MailInput(),
              SizedBox(height: 20.h),
              _PasswordInput(),
              SizedBox(height: 60.h),
              const _FormButton(),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Don't have an account?",
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            color: gray,
                          )),
                  TextButton(
                    onPressed: () {
                      AutoRouter.of(context).replace(const RegisterRoute());
                    },
                    child: const Text(
                      "Register",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MailInput extends ConsumerWidget {
  const MailInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(loginProvider.notifier);
    return CustomTextField(
      initialValue: "",
      validator: (value) => ref.watch(loginProvider).userNameFailure.error,
      onChanged: notifier.onEmailChanged,
      onFieldSubmitted: notifier.onEmailChanged,
      onSaved: (newValue) => notifier.onEmailChanged(newValue!),
      labelText: "Email",
    );
  }
}

class _PasswordInput extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(loginProvider.notifier);
    return PasswordTextField(
      onChanged: notifier.onPasswordChanged,
      validator: (value) => ref.watch(loginProvider).passwordFailure.error,
      onFieldSubmitted: notifier.onPasswordChanged,
      onSaved: (newValue) => notifier.onPasswordChanged(newValue!),
      labelText: "Password",
    );
  }
}

class _FormButton extends ConsumerWidget {
  const _FormButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomButton(
        text: "Join",
        onPressed: () async {
          if (ref.watch(_keyProvider).currentState!.validate()) {
            await ref.read(loginProvider.notifier).login();

            if (ref.watch(loginProvider).status == AuthStatus.authenticated) {
              Future.delayed(const Duration(seconds: 1), () {
                context.router.replace(const AuthGateRoute());
              });
            }
          }

          //giriş yapıldıysa 1 saniye sonra sayfayı değiştir

          //formu kontrol et
        });
  }
}
