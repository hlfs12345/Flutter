import 'package:financy_app/common/constants/app_colors.dart';
import 'package:financy_app/common/utils/input_validators.dart';
import 'package:financy_app/common/widgets/action_text_button.dart';
import 'package:financy_app/common/widgets/custom_text_form_field.dart';
import 'package:financy_app/common/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

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
            key: _formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  labelText: 'Your Name',
                  hintText: 'Full Name',
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                  validator: InputValidators.name,
                ),
                CustomTextFormField(
                  labelText: 'Your E-mail',
                  hintText: 'email@email.com',
                  textInputAction: TextInputAction.next,
                  validator: InputValidators.email,
                ),
                CustomTextFormField(
                  controller: passwordController,
                  labelText: 'choose YourPassword',
                  hintText: '********',
                  isPassword: true,
                  textInputAction: TextInputAction.done,
                  helperText:
                      'Must have at least 8 characteres, 1 capital letter and 1 number.',
                  validator: InputValidators.password,
                ),
                CustomTextFormField(
                  controller: confirmPasswordController,
                  labelText: 'Confirm Your Password',
                  hintText: '********',
                  isPassword: true,
                  textInputAction: TextInputAction.done,
                  validator: (value) => InputValidators.confirmPassword(
                    value,
                    passwordController.text,
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: PrimaryButton(
              text: 'Sign Up',
              onPressed: () {
                final valid =
                    _formKey.currentState != null &&
                    _formKey.currentState!.validate();
                if (valid) {
                  print('Continuar login');
                } else {
                  print('Erro ao logar');
                }
              },
            ),
          ),
          CustomTextButton(
            primaryText: 'Already have account? ',
            actionText: 'Sign In',
            onPressed: () => print('account Sign In'),
          ),
          const SizedBox(height: 40.0),
        ],
      ),
    );
  }
}
