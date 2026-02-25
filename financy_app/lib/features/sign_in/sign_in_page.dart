import 'package:financy_app/common/constants/app_colors.dart';
import 'package:financy_app/common/constants/app_text_styles.dart';
import 'package:financy_app/common/constants/routes.dart';
import 'package:financy_app/common/utils/input_validators.dart';
import 'package:financy_app/common/widgets/action_text_button.dart';
import 'package:financy_app/common/widgets/custom_circular_progress_indicator.dart';
import 'package:financy_app/common/widgets/custom_modal_bottom_sheet.dart';
import 'package:financy_app/common/widgets/custom_text_form_field.dart';
import 'package:financy_app/common/widgets/primary_button.dart';
import 'package:financy_app/features/sign_in/sign_in_controller.dart';
import 'package:financy_app/features/sign_in/sign_in_state.dart';
import 'package:financy_app/locator.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInState();
}

class _SignInState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _controller = locator.get<SignInController>();

  @override
  void initState() {
    _controller.addListener(() {
      if (_controller.state is SignInStateLoading) {
        showDialog(
          context: context,
          builder: (context) =>
              const Center(child: customCircularProgressIndicator()),
        );
      }
      if (_controller.state is SignInStateSuccess) {
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, NamedRoute.home);
      }
      if (_controller.state is SignInStateError) {
        final error = _controller.state as SignInStateError;
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
    _controller.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.iceWhite,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Center(
              child: Text(
                'Welcome Back',
                style: AppTextStyles.mediumText.copyWith(
                  color: AppColors.finalGradientColor,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(child: Image.asset('assets/images/login.png')),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextFormField(
                  controller: _emailController,
                  labelText: 'E-mail',
                  hintText: 'email@email.com',
                  textInputAction: TextInputAction.next,
                  validator: InputValidators.email,
                ),
                CustomTextFormField(
                  controller: _passwordController,
                  labelText: 'Password',
                  hintText: '********',
                  isPassword: true,
                  textInputAction: TextInputAction.done,
                  validator: InputValidators.password,
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: PrimaryButton(
              text: 'Sign In',
              onPressed: () {
                final valid =
                    _formKey.currentState != null &&
                    _formKey.currentState!.validate();
                if (valid) {
                  _controller.signIn(
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
            primaryText: 'Don\'t you have account? ',
            actionText: 'Sign Up',
            onPressed: () =>
                Navigator.popAndPushNamed(context, NamedRoute.signUp),
          ),
          const SizedBox(height: 40.0),
        ],
      ),
    );
  }
}
