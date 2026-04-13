import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryGreen = Color(0xFF1B6B2A);
  static const Color darkGreen = Color(0xFF145222);
  static const Color lightGreen = Color(0xFF4CAF50);
  static const Color accentGreen = Color(0xFF2E7D32);
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color grey = Color(0xFF9E9E9E);
  static const Color lightGrey = Color(0xFFF5F5F5);
  static const Color orange = Color(0xFFFF9800);
  static const Color red = Color(0xFFE53935);
  static const Color gold = Color(0xFFFFD700);
  static const Color cardBg = Color(0xFFF8F8F8);
  static const Color bronze = Color(0xFFCD7F32);
  static const Color silver = Color(0xFFC0C0C0);
  static const Color platinum = Color(0xFFE5E4E2);
  static const Color diamond = Color(0xFF607D8B);
  static const Color bgCream = Color(0xFFFAF9F6);
  static const Color borderGrey = Color(0xFFE8E8E8);
  static const Color textDark = Color(0xFF333333);
  static const Color textMuted = Color(0xFF888888);
  static const Color cardShadow = Color(0x14000000);
  static const Color bannerGreen = Color(0xFF1B5E20);
  static const Color transitGreen = Color(0xFFE8F5E9);
  static const Color transitIconGreen = Color(0xFF388E3C);
}

class AppTextStyles {
  static const TextStyle heading = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
  );
  static const TextStyle subheading = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );
  static const TextStyle body = TextStyle(
    fontSize: 14,
    color: AppColors.black,
  );
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    color: AppColors.grey,
  );
  static const TextStyle price = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryGreen,
  );
  static const TextStyle strikePrice = TextStyle(
    fontSize: 12,
    color: AppColors.grey,
    decoration: TextDecoration.lineThrough,
  );
  static const TextStyle discount = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: AppColors.red,
  );
}
