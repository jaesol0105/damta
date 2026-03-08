import 'package:damta/core/theme/app_colors.dart';
import 'package:damta/core/theme/app_theme.dart';
import 'package:damta/presentation/home/view/widgets/home_actions.dart';
import 'package:flutter/material.dart';

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

  /// AppBar 타이틀 부분
  static Widget buildTitle({
    required BuildContext context,
    required bool isEditMode,
    required String schoolName,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // 로고 이미지
        Transform.translate(
          offset: const Offset(0, 1),
          child: Image.asset(
            'assets/images/damta_icon_app_bar.png',
            height: 28,
          ),
        ),
        SizedBox(width: 10),
        // 앱 제목, 오버플로우 방지
        Flexible(
          child: Transform.translate(
            offset: const Offset(0, 2),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Text(
                schoolName,
                maxLines: 1,
                style: TextStyle(
                  letterSpacing: -0.3,
                  fontWeight: FontWeight.bold,
                  color: vrc(context).labelText,
                  fontSize: 22,
                ),
              ),
            ),
          ),
        ),
        // 편집 모드
        if (isEditMode) ...[
          const SizedBox(width: 10),
          // 편집 중 표시 카드
          Transform.translate(
            offset: const Offset(0, 1.3),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Color(0xFFD8ECFF),
                borderRadius: BorderRadius.circular(999),
              ),
              child: Text(
                '편집 중',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }

  /// AppBar 액션 목록
  static List<Widget> buildActions({
    required BuildContext context,
    required bool isEditMode,
    required VoidCallback onAddPhoto,
    required VoidCallback onExitEdit,
    required VoidCallback onSettings,
  }) {
    // 편집 모드
    if (isEditMode) {
      return [
        // 홈 화면에 사진 모듈 추가
        Padding(
          padding: EdgeInsetsGeometry.only(right: 20),
          child: GestureDetector(
            onTap: onAddPhoto,
            child: Transform.translate(
              offset: const Offset(0, 1),
              child: Text(
                '사진추가',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: AppColors.secondaryHeavy,
                ),
              ),
            ),
          ),
        ),
        // 홈 화면 편집 모드 끝내기
        Padding(
          padding: EdgeInsetsGeometry.only(right: 20),
          child: GestureDetector(
            onTap: onExitEdit,
            child: Transform.translate(
              offset: const Offset(0, 1),
              child: Text(
                '완료',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: vrc(context).contentText,
                ),
              ),
            ),
          ),
        ),
      ];
    } else {
      // 홈 화면 기본 액션 목록
      return [Builder(builder: (context) => HomeActions())];
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
