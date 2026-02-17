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
  final bool isPassword;
  final String? helperText;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  const CustomTextFormField({
    super.key,
    this.padding,
    required this.labelText,
    this.hintText,
    this.textCapitalization,
    this.textInputType,
    this.textInputAction,
    this.isPassword = false,
    this.validator,
    this.helperText,
    this.controller,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _isObscure;
  String? _helperText;
  final defaultBorder = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.finalGradientColor),
  );

  @override
  void initState() {
    super.initState();
    _isObscure = widget.isPassword;
    _helperText = null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          widget.padding ??
          EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
      child: TextFormField(
        controller: widget.controller,
        onChanged: (value) {
          if (value.isEmpty) {
            setState(() {
              _helperText = null;
            });
          } else if (value.length == 1) {
            setState(() {
              _helperText = widget.helperText;
            });
          }
        },
        onEditingComplete: () {
          setState(() {
            _helperText = null;
          });
        },
        textCapitalization:
            widget.textCapitalization ?? TextCapitalization.none,
        textInputAction: widget.textInputAction,
        keyboardType: widget.textInputType,
        validator: widget.validator,
        style: AppTextStyles.textFormInnerText.copyWith(
          color: AppColors.finalGradientColor,
        ),
        obscureText: widget.isPassword ? _isObscure : false,
        decoration: InputDecoration(
          labelStyle: AppTextStyles.inputLabelText.copyWith(
            color: AppColors.gray,
          ),
          labelText: widget.labelText.toUpperCase(),
          hintText: widget.hintText ?? '',
          hintStyle: AppTextStyles.inputHintText.copyWith(
            color: AppColors.gray,
          ),
          helperText: _helperText,
          helperStyle: AppTextStyles.smallText.copyWith(
            color: AppColors.initialGradientColor,
          ),
          helperMaxLines: 3,
          errorMaxLines: 3,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: defaultBorder,
          focusedBorder: defaultBorder,
          errorBorder: defaultBorder.copyWith(
            borderSide: BorderSide(color: AppColors.red),
          ),
          focusedErrorBorder: defaultBorder,
          disabledBorder: defaultBorder,
          enabledBorder: defaultBorder,
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    color: AppColors.finalGradientColor,
                    _isObscure ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                )
              : null,
        ),
      ),
    );
  }
}
