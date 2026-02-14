import 'package:financy_app/common/constants/app_colors.dart';
import 'package:financy_app/common/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String primaryText;
  final String actionText;
  final VoidCallback? onPressed;
  const CustomTextButton({
    super.key,
    required this.primaryText,
    required this.actionText,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          primaryText,
          style: AppTextStyles.smallText.copyWith(color: AppColors.darkGray),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(4),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              child: Text(
                actionText,
                style: AppTextStyles.smallText.copyWith(
                  color: AppColors.initialGradientColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
