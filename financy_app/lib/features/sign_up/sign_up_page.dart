import 'package:financy_app/common/constants/app_colors.dart';
import 'package:financy_app/common/constants/app_text_styles.dart';
import 'package:financy_app/common/widgets/action_text_button.dart';
import 'package:financy_app/common/widgets/custom_text_form_field.dart';
import 'package:financy_app/common/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Expanded(
            child: Container(
              color: AppColors.iceWhite,
              child: Image.asset('assets/images/register.png'),
            ),
          ),
          Form(
            child: Column(
              children: [
                CustomTextFormField(
                  labelText: 'Your Name',
                  hintText: 'Full Name',
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                ),
                CustomTextFormField(
                  labelText: 'E-mail',
                  hintText: 'email@email.com',
                  textInputAction: TextInputAction.next,
                ),
                CustomTextFormField(
                  labelText: 'Password',
                  hintText: '********',
                  textInputAction: TextInputAction.next,
                ),
                CustomTextFormField(
                  labelText: 'Confirm Password',
                  hintText: '********',
                  textInputAction: TextInputAction.done,
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: PrimaryButton(
              text: 'Sign Up',
              onPressed: () => print('teste Sign Up'),
            ),
          ),
          CustomTextButton(
            primaryText: 'Already have account? ',
            actionText: 'Sign In',
            onPressed: () => print('account SignIn'),
          ),
          const SizedBox(height: 40.0),
        ],
      ),
    );
  }
}
