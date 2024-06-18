import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greenapp/constants/colors.dart';
import 'package:greenapp/customs/custom_app_bar.dart';
import 'package:greenapp/customs/custom_button.dart';
import 'package:greenapp/customs/custom_text_field.dart';
import 'package:greenapp/features/profile/presentation/providers/edit_profile_provider.dart';
import 'package:greenapp/features/profile/presentation/widgets/profile_image_widget.dart';
import 'package:greenapp/utils/formatters/formatters.dart';
import 'package:image_picker/image_picker.dart';

final _keyProvider = Provider.autoDispose((ref) => GlobalKey<FormState>(
      debugLabel: 'EditProfileForm',
    ));

@RoutePage()
class EditProfilePage extends ConsumerWidget {
  const EditProfilePage({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(editprofileProvider);

    return PopScope(
      child: Scaffold(
        appBar: const CustomAppBar(
          leadingText: "Edit Profile",
        ),
        body: state.editableUser == null
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.r),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 16.h),
                      const _ProfileImagePart(),
                      SizedBox(height: 16.h),
                      const _InputForm(),
                    ]),
              ),
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
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Padding(
                  padding: EdgeInsets.all(16.r),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: Icon(Icons.camera, color: primary),
                        title: Text('Camera'),
                        onTap: () async {
                          File? _image;
                          final picker = ImagePicker();
                          picker
                              .pickImage(source: ImageSource.camera)
                              .then((value) {
                            if (value != null) {
                              _image = File(value.path);
                              print('Image path: ${_image!.path}');
                              ref
                                  .read(editprofileProvider.notifier)
                                  .changeProfileImage(
                                    _image!.path,
                                  );
                            }
                          });
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.photo_library, color: primary),
                        title: Text('Gallery'),
                        onTap: () {
                          File? _image;
                          final picker = ImagePicker();
                          picker
                              .pickImage(source: ImageSource.gallery)
                              .then((value) {
                            if (value != null) {
                              _image = File(value.path);
                              print('Image path: ${_image!.path}');
                              ref
                                  .read(editprofileProvider.notifier)
                                  .changeProfileImage(
                                    _image!.path,
                                  );
                            }
                          });

                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                );
              },
            ).then((value) {
              if (value != null) {
                print('Image path: $value');
              }
            });
          },
          child: ProfileImageWidget(
            size: 150,
            image: state.editableUser!.profileImage.toString(),
            editingImage: state.profileImagePath,
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

class _InputForm extends ConsumerWidget {
  const _InputForm({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: ref.watch(_keyProvider),
      child: const Column(
        children: [
          _EmailInput(),
          SizedBox(height: 16),
          _NameInput(),
          SizedBox(height: 16),
          _SurnameInput(),
          SizedBox(height: 16),
          _PhoneInput(),
          SizedBox(height: 32),
          _SaveButton(),
        ],
      ),
    );
  }
}

class _NameInput extends ConsumerWidget {
  const _NameInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(editprofileProvider);
    final notifier = ref.read(editprofileProvider.notifier);
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
          initialValue: state.name,
          validator: (value) => state.nameValidation.error,
          onChanged: (value) => notifier.nameChanged(value),
          onEditingComplete: () => notifier.nameChanged(state.name),
          onSaved: (value) => notifier.nameChanged(value!),
          onFieldSubmitted: (value) => notifier.nameChanged(value),
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
          validator: (value) => state.surnameValidation.error,
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
  const _PhoneInput();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(editprofileProvider);
    final notifier = ref.watch(editprofileProvider.notifier);
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
        Row(
          children: [
            Container(
              height: 55.h,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: gray, width: 1.w),
              ),
              child: CountryCodePicker(
                initialSelection: "TR",
              ),
            ),
            SizedBox(
              width: 8.w,
            ),
            Expanded(
              child: CustomTextField(
                validator: (value) => state.phoneValidation.error,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  PhoneNumberFormatter(),
                  LengthLimitingTextInputFormatter(14)
                ],
                initialValue: state.phone,
                hintText: "Phone",
                onChanged: (value) => notifier.phoneChanged(value),
                onFieldSubmitted: (value) => notifier.phoneChanged(value),
                onEditingComplete: () => notifier.phoneChanged,
                onSaved: (value) => notifier.phoneChanged,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _SaveButton extends ConsumerWidget {
  const _SaveButton({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(editprofileProvider);
    return CustomButton(
      onPressed: (!state.isEditing && !state.isEditingImage)
          ? null
          : () async {
              if (ref.read(_keyProvider).currentState!.validate()) {
                final BuildContext context =
                    ref.read(_keyProvider).currentState!.context;
                ref.read(editprofileProvider.notifier).save().then((_) {
                  //snackbar success message
                  SnackBar snackBar = const SnackBar(
                    content: Text("Profile updated successfully"),
                    backgroundColor: primary,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  if (Navigator.canPop(context)) {
                    context.router.maybePop();
                  }
                });
              }
            },
      text: "Save",
    );
  }
}
