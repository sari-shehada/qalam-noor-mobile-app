import 'dart:ui';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MiscColors {
  static double globalBorderRadius = 15.r;
  static List<Color> miscColors = const [
    Color(0xFFBB6BCD),
    Color(0xFF935ACC),
    Color(0xFF8B79EB),
    Color(0xFF899EE8),
    Color(0xFF3983D2),
    Color(0xFFA5D9FD),
    Color(0xFF76B6D2),
    Color(0xFF94DADC),
    Color(0xFF64D1AE),
    Color(0xFF62C378),
    Color(0xFF4EA337),
    Color(0xFF76CE38),
    Color(0xFFDAEC39),
    Color(0xFFFAE739),
    Color(0xFFF3AF2F),
    Color(0xFFEE7B28),
    Color(0xFFEA3A22),
  ];

  static Color getMiscColor(int index) {
    return miscColors[index % miscColors.length];
  }
}
