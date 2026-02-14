import 'package:financy_app/common/constants/app_colors.dart';
import 'package:financy_app/common/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final EdgeInsetsGeometry? padding;
  final String labelText;
  final String? hintText;
  final TextCapitalization? textCapitalization;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  const CustomTextFormField({
    super.key,
    this.padding,
    required this.labelText,
    this.hintText,
    this.textCapitalization,
    this.textInputType,
    this.textInputAction,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  final defaultBorder = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.finalGradientColor),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          widget.padding ??
          EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
      child: TextFormField(
        textCapitalization:
            widget.textCapitalization ?? TextCapitalization.none,
        textInputAction: widget.textInputAction,
        keyboardType: widget.textInputType,
        style: AppTextStyles.textFormInnerText.copyWith(
          color: AppColors.finalGradientColor,
        ),
        decoration: InputDecoration(
          labelStyle: AppTextStyles.inputLabelText.copyWith(
            color: AppColors.gray,
          ),
          labelText: widget.labelText.toUpperCase(),
          hintText: widget.hintText ?? '',
          hintStyle: AppTextStyles.inputLabelText.copyWith(
            color: AppColors.gray,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: defaultBorder,
          focusedBorder: defaultBorder,
          errorBorder: defaultBorder,
          focusedErrorBorder: defaultBorder,
          disabledBorder: defaultBorder,
          enabledBorder: defaultBorder,
        ),
      ),
    );
  }
}
