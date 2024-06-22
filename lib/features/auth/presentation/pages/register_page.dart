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
import '../providers/register_provider.dart';

final _keyProvider = Provider.autoDispose((ref) => GlobalKey<FormState>());

@RoutePage()
class RegisterPage extends ConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(registerProvider);
    return Scaffold(
      body: OverlayWidget(
        error: state.failure,
        status: state.status,
        onTap: () {
          ref.read(registerProvider.notifier).resetStatus();
        },
        child: _RegisterPageContent(),
      ),
    );
  }
}

class _RegisterPageContent extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(20.r),
        child: Column(
          children: [
            SizedBox(height: 50.h),
            Icon(
              Icons.account_circle,
              size: 120.r,
            ),
            Text(
              "Register",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 30.h),
            _RegisterForm(),
            SizedBox(height: 20.h),
            _LoginRedirect(),
          ],
        ),
      ),
    );
  }
}

class _RegisterForm extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: ref.watch(_keyProvider),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _MailInput(),
          SizedBox(height: 20.h),
          _NameInput(),
          SizedBox(height: 20.h),
          _SurnameInput(),
          SizedBox(height: 20.h),
          _PasswordInput(),
          SizedBox(height: 20.h),
          _PasswordCheckInput(),
          SizedBox(height: 40.h),
          const FormButton(),
        ],
      ),
    );
  }
}

class _NameInput extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(registerProvider.notifier);
    return CustomTextField(
      initialValue: "",
      validator: (value) => value!.isEmpty ? "Name can't be empty" : null,
      onChanged: notifier.onNameChanged,
      onFieldSubmitted: notifier.onNameChanged,
      onSaved: (newValue) => notifier.onNameChanged(newValue!),
      labelText: "Name",
    );
  }
}

class _SurnameInput extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(registerProvider.notifier);
    return CustomTextField(
      initialValue: "",
      validator: (value) => value!.isEmpty ? "Surname can't be empty" : null,
      onChanged: notifier.onSurnameChanged,
      onFieldSubmitted: notifier.onSurnameChanged,
      onSaved: (newValue) => notifier.onSurnameChanged(newValue!),
      labelText: "Surname",
    );
  }
}

class _MailInput extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(registerProvider.notifier);
    return CustomTextField(
      initialValue: "",
      validator: (value) => ref.watch(registerProvider).mailFailure.error,
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
    final notifier = ref.watch(registerProvider.notifier);
    return PasswordTextField(
      onChanged: notifier.onPasswordChanged,
      validator: (value) => ref.watch(registerProvider).passwordFailure.error,
      onFieldSubmitted: notifier.onPasswordChanged,
      onSaved: (newValue) => notifier.onPasswordChanged(newValue!),
      labelText: "Password",
    );
  }
}

class _PasswordCheckInput extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(registerProvider.notifier);
    return PasswordTextField(
      onChanged: notifier.onPasswordCheckChanged,
      validator: (value) =>
          ref.watch(registerProvider).passwordCheckFailure.error,
      onFieldSubmitted: notifier.onPasswordCheckChanged,
      onSaved: (newValue) => notifier.onPasswordCheckChanged(newValue!),
      labelText: "Password Check",
    );
  }
}

class FormButton extends ConsumerWidget {
  const FormButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomButton(
        text: "Sign Up",
        onPressed: () async {
          if (ref.read(_keyProvider).currentState!.validate()) {
            await ref.read(registerProvider.notifier).register();

            if (ref.watch(registerProvider).status ==
                AuthStatus.authenticated) {
              context.router.replaceAll([const LoginRoute()]);
            }
          }
        });
  }
}
//login yönlendirme

class _LoginRedirect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Already have an account?",
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: gray,
                ),
          ),
          TextButton(
            onPressed: () {
              context.router.replace(const LoginRoute());
            },
            child: const Text(
              "Login",
            ),
          ),
        ],
      ),
    );
  }
}
