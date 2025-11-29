import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/di/di.dart';
import 'package:online_exam/core/utils/app_toast.dart';
import 'package:online_exam/core/utils/app_validator.dart';
import 'package:online_exam/core/widgets/custom_elevated_button.dart';
import 'package:online_exam/core/widgets/custom_text_form_field.dart';
import 'package:online_exam/features/profile/presenstation/view_model/profile_state.dart';
import 'package:online_exam/features/profile/presenstation/view_model/profile_view_model.dart';

class ResetPasswordProfile extends StatefulWidget {
  const ResetPasswordProfile({super.key});
  static const String routeName = "Reset-View";

  @override
  State<ResetPasswordProfile> createState() => _ResetPasswordProfileState();
}

class _ResetPasswordProfileState extends State<ResetPasswordProfile> {
  late TextEditingController _currentPassword;
  late TextEditingController _newPassword;
  late TextEditingController _confirmPassword;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _currentPassword = TextEditingController();
    _confirmPassword = TextEditingController();
    _newPassword = TextEditingController();
    _formKey = GlobalKey();
    super.initState();
  }

  @override
  void dispose() {
    _currentPassword.dispose();
    _confirmPassword.dispose();
    _newPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileViewModel>(),
      child: Scaffold(
        appBar: AppBar(title: Text("Reset Password")),
        body: BlocConsumer<ProfileViewModel, ProfileState>(
          listener: (context, state) {
            if (state.changePassword.isSuccess) {
              Toast.showToast(
                context: context,
                msg: "Password Changed Successfully",
              );
              Navigator.pop(context);
            }
            if (state.changePassword.isFailure) {
              Toast.showToast(
                context: context,
                msg:
                    state.changePassword.errorMessage ??
                    "Failed to change password",
              );
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    spacing: 24,
                    children: [
                      SizedBox(height: 10),
                      CustomTextFormField(
                        controller: _currentPassword,
                        hintText: "Current Password",
                        labelText: "Current Password",
                        validator: AppValidator.validatePassword,
                      ),
                      CustomTextFormField(
                        controller: _newPassword,
                        hintText: "New Password",
                        labelText: "New Password",
                        validator: AppValidator.validatePassword,
                      ),
                      CustomTextFormField(
                        controller: _confirmPassword,
                        hintText: "Confirm Password",
                        labelText: "Confirm Password",
                        validator: (value) =>
                            AppValidator.validateConfirmPassword(
                              value,
                              _newPassword.text,
                            ),
                      ),
                      SizedBox(height: 54),
                      CustomElevatedButton(
                        textOnButton: "Update",
                        child: state.changePassword.isLoading
                            ? CircularProgressIndicator(color: Colors.white)
                            : null,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<ProfileViewModel>().changePassword(
                              _currentPassword.text,
                              _newPassword.text,
                              _confirmPassword.text,
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
