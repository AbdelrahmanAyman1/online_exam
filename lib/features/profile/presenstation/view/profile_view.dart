import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/di/di.dart';
import 'package:online_exam/core/state_box/state_box.dart';
import 'package:online_exam/core/utils/app_colors.dart';
import 'package:online_exam/core/utils/app_toast.dart';
import 'package:online_exam/core/utils/app_validator.dart';
import 'package:online_exam/core/utils/text_styles.dart';
import 'package:online_exam/core/widgets/custom_elevated_button.dart';
import 'package:online_exam/core/widgets/custom_text_form_field.dart';
import 'package:online_exam/features/profile/domain/entity/user_info_entity.dart';
import 'package:online_exam/features/profile/presenstation/view/reset_password_profile_view.dart';
import 'package:online_exam/features/profile/presenstation/view_model/profile_state.dart';
import 'package:online_exam/features/profile/presenstation/view_model/profile_view_model.dart';
import 'package:online_exam/features/profile/presenstation/widget/choose_image_picker.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _userNameController;
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _phoneNumberController;
  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _userNameController = TextEditingController();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _phoneNumberController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt.get<ProfileViewModel>()..doIntent(GetProfileInfoEvent()),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: BlocBuilder<ProfileViewModel, ProfileState>(
                buildWhen: (previous, current) =>
                    previous.profileInfo != current.profileInfo,
                builder: (context, state) {
                  switch (state.profileInfo.stateType) {
                    case StateType.initial:
                    case StateType.loading:
                      return Center(child: CircularProgressIndicator());
                    case StateType.success:
                      _initTextForms(state.profileInfo.data);
                      return _buildSuccessState(state.profileInfo.data);
                    case StateType.failure:
                      return Center(
                        child: Text(
                          state.profileInfo.errorMessage ?? "not get Data",
                        ),
                      );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _initTextForms(UserInfoEntity? userInfo) {
    _firstNameController.text = userInfo?.user?.firstName ?? "";
    _lastNameController.text = userInfo?.user?.lastName ?? "";
    _emailController.text = userInfo?.user?.email ?? "";
    _phoneNumberController.text = userInfo?.user?.phoneNumber ?? "";
    _userNameController.text = userInfo?.user?.userName ?? "";
    _passwordController.text = "********";
  }

  Widget _buildSuccessState(UserInfoEntity? userInfo) {
    return Builder(
      builder: (context) {
        return BlocListener<ProfileViewModel, ProfileState>(
          listener: (context, state) {
            if (state.updateProfileInfo.isSuccess) {
              Toast.showToast(
                context: context,
                msg: state.updateProfileInfo.data?.message ?? "Success",
              );
            }
            if (state.updateProfileInfo.isFailure) {
              Toast.showToast(
                context: context,
                msg: state.updateProfileInfo.errorMessage ?? "Failure",
              );
            }
          },
          child: Column(
            spacing: 17,
            children: [
              SizedBox(height: 14),
              Align(
                alignment: AlignmentGeometry.topLeft,
                child: Text("Profile", style: TextStyles.medium20),
              ),
              SizedBox(height: 14),
              ChooseImagePicker(),
              SizedBox(height: 14),
              CustomTextFormField(
                hintText: userInfo?.user?.userName ?? "UnKnown",
                labelText: 'User name',
                keyboardType: TextInputType.name,
                controller: _userNameController,
                validator: (value) => AppValidator.validateUsername(value),
              ),
              Row(
                spacing: 17,
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      hintText: userInfo?.user?.firstName ?? "UnKnown",
                      labelText: 'First name',
                      keyboardType: TextInputType.name,
                      controller: _firstNameController,
                      validator: (value) =>
                          AppValidator.validateFirstName(value),
                    ),
                  ),
                  Expanded(
                    child: CustomTextFormField(
                      hintText: userInfo?.user?.lastName ?? "UnKnown",
                      labelText: 'Last name',
                      keyboardType: TextInputType.name,
                      controller: _lastNameController,
                      validator: (value) =>
                          AppValidator.validateLastName(value),
                    ),
                  ),
                ],
              ),
              CustomTextFormField(
                hintText: userInfo?.user?.email ?? "UnKnown",
                labelText: 'Email',
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                validator: (value) => AppValidator.validateEmail(value),
              ),
              CustomTextFormField(
                readOnly: true,
                hintText: '********',
                suffix: GestureDetector(
                  onTap: () => Navigator.of(
                    context,
                  ).pushNamed(ResetPasswordProfile.routeName),
                  child: Text(
                    "Change",
                    style: TextStyles.regular12.copyWith(
                      color: AppColors.blueBase,
                    ),
                  ),
                ),

                labelText: 'Password',
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
              ),
              CustomTextFormField(
                hintText: userInfo?.user?.phoneNumber ?? "UnKnown",
                labelText: 'Phone number',
                controller: _phoneNumberController,
                keyboardType: TextInputType.phone,
                validator: (value) => AppValidator.validatePhone(value),
              ),
              SizedBox(height: 20),
              BlocBuilder<ProfileViewModel, ProfileState>(
                buildWhen: (previous, current) =>
                    previous.updateProfileInfo != current.updateProfileInfo,
                builder: (context, state) {
                  if (state.updateProfileInfo.isLoading) {
                    return CircularProgressIndicator();
                  }
                  return CustomElevatedButton(
                    textOnButton: 'Update',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        var userUpdata = UserEntity(
                          email: _emailController.text,
                          firstName: _firstNameController.text,
                          lastName: _lastNameController.text,
                          phoneNumber: _phoneNumberController.text,
                          userName: _userNameController.text,
                        );
                        context.read<ProfileViewModel>().doIntent(
                          ChangeProfileUpdateEvent(entity: userUpdata),
                        );
                      }
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
