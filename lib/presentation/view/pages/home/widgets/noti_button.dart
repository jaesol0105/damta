import 'package:damta/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotiButton extends StatelessWidget {
  const NotiButton({super.key});

  // 새로운 알림 여부
  // TODO : 더미데이터 지우기
  final bool newNoti = true;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.go('/notification'),
      child: SizedBox(
        width: 60,
        height: 60,
        child: Stack(
          children: [
            Center(child: Icon(Icons.notifications_none, size: 30, color: darkgrey)),
            newNoti
                ? Align(
                    alignment: Alignment(0.3, -0.3),
                    child: Icon(Icons.circle, size: 10, color: Colors.red),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
