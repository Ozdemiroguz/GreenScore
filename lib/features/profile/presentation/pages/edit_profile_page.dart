import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenapp/constants/colors.dart';
import 'package:greenapp/customs/custom_app_bar.dart';
import 'package:greenapp/customs/custom_button.dart';
import 'package:greenapp/customs/custom_text_field.dart';
import 'package:greenapp/features/profile/presentation/providers/edit_profile_provider.dart';
import 'package:greenapp/features/profile/presentation/widgets/profile_image_widget.dart';

@RoutePage()
class EditProfilePage extends ConsumerWidget {
  const EditProfilePage({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(editprofileProvider);

    return Scaffold(
      appBar: const CustomAppBar(
        leadingText: "Edit Profile",
      ),
      body: state.editableUser == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.r),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                SizedBox(height: 16.h),
                const _ProfileImagePart(),
                SizedBox(height: 16.h),
                const _EmailInput(),
                SizedBox(height: 16.h),
                const _NameInput(),
                SizedBox(height: 16.h),
                const _SurnameInput(),
                SizedBox(height: 16.h),
                const _PhoneInput(),
                SizedBox(height: 32.h),
                if (state.isEditing) const _SaveButton(),
              ]),
            ),
    );
  }
}

class _ProfileImagePart extends ConsumerWidget {
  const _ProfileImagePart({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(editprofileProvider);

    return Stack(
      alignment: Alignment.center,
      children: [
        GestureDetector(
          onTap: () {},
          child: ProfileImageWidget(
            size: 150,
            image: state.editableUser!.profileImage.toString(),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.all(8.r),
            decoration: const BoxDecoration(
              color: primary,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.camera_alt,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class _NameInput extends ConsumerWidget {
  const _NameInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(editprofileProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Name",
          style: Theme.of(context).textTheme.displayMedium,
        ),
        SizedBox(
          height: 8.h,
        ),
        CustomTextField(
          initialValue: state.editableUser!.name,
          hintText: "Name",
        ),
      ],
    );
  }
}

class _SurnameInput extends ConsumerWidget {
  const _SurnameInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(editprofileProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Surname",
          style: Theme.of(context).textTheme.displayMedium,
        ),
        SizedBox(
          height: 8.h,
        ),
        CustomTextField(
          initialValue: state.editableUser!.surname,
          hintText: "Surname",
        ),
      ],
    );
  }
}

class _EmailInput extends ConsumerWidget {
  const _EmailInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(editprofileProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Email",
          style: Theme.of(context).textTheme.displayMedium,
        ),
        SizedBox(
          height: 8.h,
        ),
        CustomTextField(
          initialValue: state.editableUser!.email,
          hintText: "Email",
        ),
      ],
    );
  }
}

class _PhoneInput extends ConsumerWidget {
  const _PhoneInput({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Phone",
          style: Theme.of(context).textTheme.displayMedium,
        ),
        SizedBox(
          height: 8.h,
        ),
        const CustomTextField(
          hintText: "Phone",
        ),
      ],
    );
  }
}

class _SaveButton extends ConsumerWidget {
  const _SaveButton({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomButton(
      onPressed: () {},
      text: "Save",
    );
  }
}
