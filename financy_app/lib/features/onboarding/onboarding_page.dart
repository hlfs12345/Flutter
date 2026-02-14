import 'package:financy_app/common/constants/app_colors.dart';
import 'package:financy_app/common/constants/app_text_styles.dart';
import 'package:financy_app/common/widgets/action_text_button.dart';
import 'package:financy_app/common/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              color: AppColors.iceWhite,
              child: Padding(
                padding: const EdgeInsets.only(top: 70.0),
                child: Image.asset('assets/images/man.png'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Text(
              'Spend Smart',
              style: AppTextStyles.mediumText.copyWith(
                color: AppColors.finalGradientColor,
              ),
            ),
          ),
          Text(
            'Save More',
            style: AppTextStyles.mediumText.copyWith(
              color: AppColors.finalGradientColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: PrimaryButton(text: 'Get Started', onPressed: () => print('teste')),
          ),
          CustomTextButton(
            primaryText: 'Already have account? ',
            actionText: 'Sign In',
            onPressed: () => print('teste'),
          ),
          const SizedBox(height: 40.0),
        ],
      ),
    );
  }
}

