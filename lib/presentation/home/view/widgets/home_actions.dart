import 'package:damta/core/service/firebase_service.dart';
import 'package:damta/core/theme/app_theme.dart';
import 'package:damta/presentation/notification/view_model/notification_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class HomeActions extends HookConsumerWidget {
  const HomeActions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uId = FirebaseService.getUId.toString();
    final notiList =
        ref.watch(notificationViewModelProvider(uId: uId)).value ?? [];
    // 내 알림 목록 중 isRead == false 인 알림이 있는지 여부
    final bool hasNewNoti = notiList.any((n) => n.isRead == false);

    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Row(
        children: [
          /// 알림
          _actionsItem(
            context,
            onTap: () => context.push("/notification/$uId"),
            icon: PhosphorIconsBold.bell,
            hasUpdate: hasNewNoti,
          ),

          /// 설정
          _actionsItem(
            context,
            onTap: () => Scaffold.of(context).openEndDrawer(),
            icon: PhosphorIconsBold.gearSix,
          ),
        ],
      ),
    );
  }

  Widget _actionsItem(
    BuildContext context, {
    required GestureTapCallback? onTap,
    required IconData icon,
    bool? hasUpdate,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            Center(
              child: PhosphorIcon(
                icon,
                size: 26,
                color: vrc(context).labelText,
              ),
            ),
            hasUpdate == null
                ? SizedBox.shrink()
                : hasUpdate
                ? Align(
                    alignment: Alignment.topRight,
                    child: Transform.translate(
                      offset: const Offset(15, 13),
                      child: Container(
                        width: 11.5,
                        height: 11.5,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: vrc(context).background!,
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
