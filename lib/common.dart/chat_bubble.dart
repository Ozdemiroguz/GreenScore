import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';

class TersUcgenPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = white;

    final path = ui.Path(); // ui.Path nesnesi oluşturun
    path.moveTo(size.width / 2, 0); // Başlangıç noktasını belirleyin
    path.lineTo(0, size.height); // Sol köşeye gidin
    path.lineTo(size.width, size.height); // Sağ köşeye gidin
    path.close(); // Yolu kapatın

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class TersUcgen extends StatelessWidget {
  const TersUcgen({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform(
      // Ters üçgeni döndürmek için Transform widget'ını kullanın
      alignment: Alignment.center,
      transform: Matrix4.rotationZ(180 * 3.1415927 / 180),
      child: CustomPaint(
        painter: TersUcgenPainter(),
        size: Size(25.w, 25.h), // Ters üçgenin boyutunu ayarlayın
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String message;

  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(8.r),
          ),
          padding: EdgeInsets.all(8.r),
          child: Text(
            message,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        TersUcgen(),
      ],
    );
  }
}
