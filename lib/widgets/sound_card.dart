import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:worddash/common_styles.dart';

class SoundCard extends StatelessWidget {
  final String name;
  final String iconPath;
  final VoidCallback onTap;
  final bool isPlaying;

  const SoundCard({
    Key? key,
    required this.name,
    required this.iconPath,
    required this.onTap,
    this.isPlaying = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isPlaying ? AppTheme.secondaryColor : AppTheme.cardColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconPath,
              height: 60,
              color: isPlaying ? Colors.white : AppTheme.primaryColor,
            ),
            const SizedBox(height: 12),
            Text(
              name,
              style: AppTheme.cardTextStyle.copyWith(
                color: isPlaying ? Colors.white : AppTheme.textColor,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}