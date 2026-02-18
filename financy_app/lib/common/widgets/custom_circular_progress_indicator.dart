import 'package:financy_app/common/constants/app_colors.dart';
import 'package:flutter/material.dart';

class customCircularProgressIndicator extends StatelessWidget {
  const customCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(color: AppColors.iceWhite));
  }
}
