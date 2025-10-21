import 'package:flutter/material.dart';
import 'package:online_exam/core/utils/app_validator.dart';
import 'package:online_exam/core/widgets/custom_elevated_button.dart';
import 'package:online_exam/core/widgets/custom_text_form_field.dart';

class SingUpForm extends StatelessWidget {
  const SingUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextFormField(
              hintText: 'Enter your user name',
              labelText: 'User name',
              keyboardType: TextInputType.name,
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
                    validator: (value) => AppValidator.validateFirstName(value),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: CustomTextFormField(
                    hintText: 'Enter last name',
                    labelText: 'Last name',
                    keyboardType: TextInputType.name,
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
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    validator: (value) =>
                        AppValidator.validateConfirmPassword(value, ''),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            CustomTextFormField(
              hintText: 'Enter phone number',
              labelText: 'Phone number',
              keyboardType: TextInputType.phone,
              validator: (value) => AppValidator.validatePhone(value),
            ),
            SizedBox(height: 30),
            CustomElevatedButton(textOnButton: 'Sign up'),
          ],
        ),
      ),
    );
  }
}
