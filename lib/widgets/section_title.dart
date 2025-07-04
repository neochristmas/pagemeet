import 'package:flutter/material.dart';
import 'package:page_meet/theme/colors.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: AppColors.text,
        fontSize: 18,
      ),
    );
  }
}
