import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class EditAnimatedCard extends HookWidget {
  /// 편집 모드일때 흔들림(jiggle)효과가 적용되는 카드위젯
  const EditAnimatedCard({
    super.key,
    required this.isEditMode,
    required this.phaseSeed,
    required this.elevation,
    required this.referenceWidth,
    required this.itemWidth,
    required this.child,
  });

  final bool isEditMode; // 편집모드
  final int phaseSeed; // 카드마다 흔들림을 다르게 줌
  final double elevation; // 카드 높이
  // 카드 폭에따라 흔들림 각도 보정을 위한 값들
  final double referenceWidth; // 기준 폭
  final double itemWidth; // 실제 폭
  final Widget child; // 실제 카드

  @override
  Widget build(BuildContext context) {
    // 애니메이션 컨트롤러
    final ctrl = useAnimationController(
      duration: const Duration(milliseconds: 240),
      initialValue: 0,
    );

    useEffect(() {
      // 편집 모드가 되면 애니메이션 적용
      if (isEditMode) {
        ctrl.repeat(reverse: true);
      } else {
        ctrl.stop();
        ctrl.value = 0;
      }
      return null;
    }, [isEditMode]);

    // 모든 카드가 서로 다른 타이밍으로 흔들리게 하기 위한 값
    final phase = ((phaseSeed % 100) / 100.0) * 2 * math.pi;

    const baseAngle = 0.015; // 기본 흔들림 각도 (단위는 '도'가 아니라 라디안임)
    final widthScale = (referenceWidth / itemWidth).clamp(0.55, 1.25);
    final maxAngle = baseAngle * widthScale; // 폭에따른 흔들림 각도 보정

    return AnimatedBuilder(
      animation: ctrl,
      builder: (context, _) {
        // 애니메이션 진행 정도 0~1
        final t = ctrl.value;
        // sin 파로 흔들림 효과, phase로 시작 지점 분산
        final angle = isEditMode
            ? math.sin((t * 2 * math.pi) + phase) * maxAngle
            : 0.0;

        // 중심 기준 회전
        return Transform.rotate(
          angle: angle,
          // 그림자 주기
          child: Material(
            color: Colors.transparent,
            elevation: elevation,
            shadowColor: const Color(0x33000000),
            borderRadius: BorderRadius.circular(14),
            child: child,
          ),
        );
      },
    );
  }
}
