import 'package:damta/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

void showCustomDialog({
  required BuildContext context,
  required String title,
  String? content,
  required String confirmText,
  required String cancelText,
  required void Function() onConfirm,
  Color? confirmColor,
  required bool reverseButtons,
}) {
  showDialog(
    context: context,
    builder: (_) => Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        width: 300,
        padding: const EdgeInsets.fromLTRB(24, 34, 24, 34),
        decoration: BoxDecoration(
          color: vrc(context).background,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: vrc(context).border!),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          spacing: 25,
          children: [
            Column(
              children: [
                // 제목
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                // 내용
                if (content != null) ...[
                  const SizedBox(height: 12),
                  Text(content, style: TextStyle(fontSize: 13, height: 1.5)),
                ],
              ],
            ),

            /// 버튼 영역
            Row(
              spacing: 12,
              children: [
                /// 취소 버튼
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context, false),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      backgroundColor: reverseButtons
                          ? confirmColor ?? Colors.amber
                          : Colors.transparent,
                      side: reverseButtons
                          ? BorderSide.none
                          : BorderSide(color: vrc(context).border!),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      cancelText,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: reverseButtons ? Colors.white : Colors.grey,
                      ),
                    ),
                  ),
                ),

                /// 완료 버튼
                Expanded(
                  child: ElevatedButton(
                    onPressed: onConfirm,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      backgroundColor: reverseButtons
                          ? Colors.transparent
                          : confirmColor ?? Colors.amber,
                      side: reverseButtons
                          ? BorderSide(color: vrc(context).border!)
                          : BorderSide.none,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      confirmText,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: reverseButtons ? Colors.grey : Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
