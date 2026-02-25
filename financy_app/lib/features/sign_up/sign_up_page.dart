import 'package:financy_app/common/constants/app_colors.dart';
import 'package:financy_app/common/constants/routes.dart';
import 'package:financy_app/common/utils/input_validators.dart';
import 'package:financy_app/common/widgets/action_text_button.dart';
import 'package:financy_app/common/widgets/custom_circular_progress_indicator.dart';
import 'package:financy_app/common/widgets/custom_modal_bottom_sheet.dart';
import 'package:financy_app/common/widgets/custom_text_form_field.dart';
import 'package:financy_app/common/widgets/primary_button.dart';
import 'package:financy_app/features/sign_up/sign_up_controller.dart';
import 'package:financy_app/features/sign_up/sign_up_state.dart';
import 'package:financy_app/locator.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _controller = locator.get<SignUpController>();

  @override
  void initState() {
    _controller.addListener(() {
      if (_controller.state is SignUpStateLoading) {
        showDialog(
          context: context,
          builder: (context) =>
              const Center(child: customCircularProgressIndicator()),
        );
      }
      if (_controller.state is SignUpStateSuccess) {
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, NamedRoute.home);
      }
      if (_controller.state is SignUpStateError) {
        final error = _controller.state as SignUpStateError;
        Navigator.pop(context);
        customModalBottomSheet(
          context,
          content: error.message,
          buttonText: 'Try again',
        );
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _controller.dispose();
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.iceWhite,
      body: ListView(
        children: <Widget>[
          Expanded(
            child: Container(
              //color: AppColors.iceWhite,
              child: Image.asset('assets/images/register.png'),
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  controller: _nameController,
                  labelText: 'Your Name',
                  hintText: 'Full Name',
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                  validator: InputValidators.name,
                ),
                CustomTextFormField(
                  controller: _emailController,
                  labelText: 'Your E-mail',
                  hintText: 'email@email.com',
                  textInputAction: TextInputAction.next,
                  validator: InputValidators.email,
                ),
                CustomTextFormField(
                  controller: _passwordController,
                  labelText: 'choose YourPassword',
                  hintText: '********',
                  isPassword: true,
                  textInputAction: TextInputAction.done,
                  helperText:
                      'Must have at least 8 characteres, 1 capital letter and 1 number.',
                  validator: InputValidators.password,
                ),
                CustomTextFormField(
                  controller: _confirmPasswordController,
                  labelText: 'Confirm Your Password',
                  hintText: '********',
                  isPassword: true,
                  textInputAction: TextInputAction.done,
                  validator: (value) => InputValidators.confirmPassword(
                    value,
                    _passwordController.text,
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
                  _controller.signUp(
                    name: _nameController.text,
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                } else {
                  print('Erro ao logar');
                }
              },
            ),
          ),
          CustomTextButton(
            primaryText: 'Already have account? ',
            actionText: 'Sign In',
            onPressed: () =>
                Navigator.popAndPushNamed(context, NamedRoute.signIn),
          ),
          const SizedBox(height: 40.0),
        ],
      ),
    );
  }
}
