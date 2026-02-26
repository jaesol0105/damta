import 'package:damta/core/theme/app_theme.dart';
import 'package:damta/presentation/home/view/widgets/noti_button.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
    required this.isEditMode,
    required this.onAddPhoto,
    required this.onExitEdit,
    required this.onSettings,
    required this.schoolName,
  });

  final bool isEditMode;
  final VoidCallback onAddPhoto;
  final VoidCallback onExitEdit;
  final VoidCallback onSettings;
  final String schoolName;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  /// AppBar 타이틀 위젯 (SliverAppBar에서도 재사용)
  static Widget buildTitle({
    required BuildContext context,
    required bool isEditMode,
    required String schoolName,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('assets/images/app_logo_ver_2.png', height: 28, width: 28),
        const SizedBox(width: 12),
        Transform.translate(
          offset: const Offset(0, 2),
          child: Text(
            schoolName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: vrc(context).labelText,
              fontSize: 22,
            ),
          ),
        ),
        if (isEditMode) ...[
          const SizedBox(width: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A1A),
              borderRadius: BorderRadius.circular(999),
            ),
            child: const Text(
              '편집 중',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ],
    );
  }

  /// AppBar 액션 위젯 목록 (SliverAppBar에서도 재사용)
  static List<Widget> buildActions({
    required BuildContext context,
    required bool isEditMode,
    required VoidCallback onAddPhoto,
    required VoidCallback onExitEdit,
    required VoidCallback onSettings,
  }) {
    if (isEditMode) {
      return [
        TextButton(
          onPressed: onAddPhoto,
          child: Text(
            '사진+',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: vrc(context).labelText,
            ),
          ),
        ),
        TextButton(
          onPressed: onExitEdit,
          child: Text(
            '완료',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: vrc(context).labelText,
            ),
          ),
        ),
      ];
    } else {
      return [
        const NotiButton(),
        IconButton(
          onPressed: onSettings,
          icon: HugeIcon(
            icon: HugeIcons.strokeRoundedSettings01,
            size: 24,
            color: vrc(context).labelText,
            strokeWidth: 2,
          ),
        ),
        const SizedBox(width: 8),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      titleSpacing: 20,
      centerTitle: false,
      title: buildTitle(
        context: context,
        isEditMode: isEditMode,
        schoolName: schoolName,
      ),
      actions: buildActions(
        context: context,
        isEditMode: isEditMode,
        onAddPhoto: onAddPhoto,
        onExitEdit: onExitEdit,
        onSettings: onSettings,
      ),
    );
  }
}
