import 'package:damta/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({
    super.key,
    required this.id,
    required this.isRead,
    required this.title,
    this.content,
    required this.time,
  });

  final String id;
  final bool isRead;
  final String title;
  final String? content;
  final String time;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        context.go('/post/:$id');
        // TODO : isRead = true 변경하기
      },
      child: Container(
        decoration: BoxDecoration(
          color: isRead ? Colors.transparent : blue,
          border: Border(bottom: BorderSide(color: grey)),
        ),
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 7,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // spacing: 15,
              children: [
                Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                // isRead
                //     ? SizedBox.shrink()
                //     : Icon(Icons.circle, color: Colors.red, size: 8),
              ],
            ),
            content == null ? SizedBox.shrink() : Text(content!),
            Text(time),
          ],
        ),
      ),
    );
  }
}
