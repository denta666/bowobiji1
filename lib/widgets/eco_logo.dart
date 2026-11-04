import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class EcoLogo extends StatelessWidget {
  final double size;
  final bool light;

  const EcoLogo({super.key, this.size = 40, this.light = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: light ? AppColors.white : AppColors.primary,
            borderRadius: BorderRadius.circular(size * 0.3),
          ),
          child: Icon(
            Icons.eco_rounded,
            size: size * 0.6,
            color: light ? AppColors.primary : AppColors.white,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          'EcoHome',
          style: TextStyle(
            fontSize: size * 0.5,
            fontWeight: FontWeight.w800,
            color: light ? AppColors.white : AppColors.dark,
          ),
        ),
      ],
    );
  }
}