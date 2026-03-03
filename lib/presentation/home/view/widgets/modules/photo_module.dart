import 'dart:io';
import 'package:damta/presentation/home/view/widgets/modules/shared/minus_button.dart';
import 'package:flutter/material.dart';

class PhotoModule extends StatelessWidget {
  /// 사진 모듈
  const PhotoModule({
    super.key,
    required this.path,
    required this.showDelete,
    required this.onDelete,
  });

  final String path;
  final bool showDelete;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: const Color(0xFFE9E9E9)),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.file(
              File(path),
              fit: BoxFit.cover, // 비율 유지 + 꽉 채움
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        ),
        if (showDelete)
          Positioned(top: 8, right: 8, child: MinusButton(onTap: onDelete)),
      ],
    );
  }
}
