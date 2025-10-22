import 'package:flutter/material.dart';
import 'package:online_exam/core/utils/app_validator.dart';
import 'package:online_exam/core/widgets/custom_elevated_button.dart';
import 'package:online_exam/core/widgets/custom_text_form_field.dart';

class SingUpForm extends StatefulWidget {
  const SingUpForm({super.key});

  @override
  State<SingUpForm> createState() => _SingUpFormState();
}

class _SingUpFormState extends State<SingUpForm> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _userNameController;
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  late TextEditingController _phoneNumberController;
  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _userNameController = TextEditingController();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
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
    _confirmPasswordController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  void _singUpFormState() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Vaild")));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("NotVaild")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFormField(
              hintText: 'Enter your user name',
              labelText: 'User name',
              keyboardType: TextInputType.name,
              controller: _userNameController,
              validator: (value) => AppValidator.validateUsername(value),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    hintText: 'Enter first name',
                    labelText: 'First name',
                    keyboardType: TextInputType.name,
                    controller: _firstNameController,
                    validator: (value) => AppValidator.validateFirstName(value),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: CustomTextFormField(
                    hintText: 'Enter last name',
                    labelText: 'Last name',
                    keyboardType: TextInputType.name,
                    controller: _lastNameController,
                    validator: (value) => AppValidator.validateLastName(value),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            CustomTextFormField(
              hintText: 'Enter your user email',
              labelText: 'Email',
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              validator: (value) => AppValidator.validateEmail(value),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomTextFormField(
                    hintText: 'Enter password',
                    labelText: 'Password',
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    validator: (value) => AppValidator.validatePassword(value),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: CustomTextFormField(
                    hintText: 'Confirm password',
                    labelText: 'Confirm password',
                    controller: _confirmPasswordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    validator: (value) => AppValidator.validateConfirmPassword(
                      value,
                      _passwordController.text,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            CustomTextFormField(
              hintText: 'Enter phone number',
              labelText: 'Phone number',
              controller: _phoneNumberController,
              keyboardType: TextInputType.phone,
              validator: (value) => AppValidator.validatePhone(value),
            ),
            SizedBox(height: 30),
            CustomElevatedButton(
              textOnButton: 'Sign up',
              onPressed: _singUpFormState,
            ),
          ],
        ),
      ),
    );
  }
}
