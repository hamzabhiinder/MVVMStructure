
import 'package:flutter/material.dart';
import 'package:mvvmstructure/res/colors.dart';

class RoundButton extends StatelessWidget {
  final String tilte;
  final bool isLoading;
  final VoidCallback onPressed;
  const RoundButton(
      {super.key,
      required this.tilte,
      this.isLoading = false,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: 40,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.buttonColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: isLoading ?const Center(child: CircularProgressIndicator(color: AppColors.whiteColor)): Text(tilte,style:const TextStyle(color: AppColors.whiteColor,fontSize: 15),),
          ),
        ),
      ),
    );
  }
}
