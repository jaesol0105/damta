import 'package:damta/core/theme/app_theme.dart';
import 'package:damta/presentation/util/open_terms_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<bool> showTermsBottomSheet(BuildContext context) async {
  return await showModalBottomSheet<bool>(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return _TermsBottomSheet();
        },
      ) ??
      false;
}

class _TermsBottomSheet extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final v = vrc(context);

    // 체크 여부 상태
    final allChecked = useState(false);
    final communityChecked = useState(false);
    final serviceChecked = useState(false);

    // 전체 체크 상태 자동 동기화
    void updateAllChecked() {
      allChecked.value = communityChecked.value && serviceChecked.value;
    }

    void toggleCommunity() {
      communityChecked.value = !communityChecked.value;
      updateAllChecked();
    }

    void toggleService() {
      serviceChecked.value = !serviceChecked.value;
      updateAllChecked();
    }

    void toggleAll() {
      final v = !allChecked.value;
      allChecked.value = v;
      communityChecked.value = v;
      serviceChecked.value = v;
    }

    final isEnabled = communityChecked.value && serviceChecked.value;

    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: v.background,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          /// 핸들 바
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: v.border,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),

          /// 제목
          const Text(
            "약관 동의",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          /// 전체 동의
          GestureDetector(
            onTap: () => toggleAll(),
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: v.border,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                spacing: 10,
                children: [
                  Icon(
                    allChecked.value
                        ? Icons.check_circle
                        : Icons.radio_button_unchecked,
                    color: allChecked.value ? Colors.amber : Colors.grey,
                  ),
                  const Text(
                    "전체 동의",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                spacing: 10,
                children: [
                  /// 커뮤니티 이용 약관
                  GestureDetector(
                    onTap: () => toggleCommunity(),
                    child: Row(
                      children: [
                        Icon(
                          communityChecked.value
                              ? Icons.check_circle
                              : Icons.radio_button_unchecked,
                          color: communityChecked.value
                              ? Colors.amber
                              : Colors.grey,
                        ),
                        const SizedBox(width: 10),
                        const Expanded(child: Text("커뮤니티 이용 약관 동의 (필수)")),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      "본 앱을 이용함으로써 사용자는 아래 사항에 동의합니다.\n\n- 혐오 표현, 차별, 괴롭힘, 협박, 성적 표현, 불법 콘텐츠를 게시할 수 없습니다.\n- 타인의 개인정보(실명, 연락처, 주소 등)를 공유할 수 없습니다.\n- 타 사용자에 대한 비방, 모욕, 악의적 행위를 금지합니다.\n- 본 앱은 무관용 원칙(Zero Tolerance Policy)을 적용합니다.\n- 위반 시 계정은 영구 정지될 수 있습니다.\n\n신고된 콘텐츠는 24시간 이내에 검토됩니다.",
                      style: TextStyle(fontSize: 13),
                    ),
                  ),

                  /// 서비스 이용 약관, 개인정보 처리방침
                  GestureDetector(
                    onTap: () => toggleService(),
                    child: Row(
                      spacing: 10,
                      children: [
                        Icon(
                          serviceChecked.value
                              ? Icons.check_circle
                              : Icons.radio_button_unchecked,
                          color: serviceChecked.value
                              ? Colors.amber
                              : Colors.grey,
                        ),
                        const Expanded(
                          child: Text("서비스 이용 약관 및 개인정보 처리방침 동의 (필수)"),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 35),
                    child: GestureDetector(
                      onTap: () => openTermsUrl(),
                      child: Row(
                        spacing: 10,
                        children: const [
                          Text(
                            "약관 자세히 보기",
                            style: TextStyle(fontSize: 13, color: Colors.grey),
                          ),
                          Icon(Icons.open_in_new, size: 14, color: Colors.grey),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// 확인 버튼
          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: isEnabled ? () => Navigator.pop(context, true) : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                disabledBackgroundColor: v.border,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                "동의하고 계속하기",
                style: TextStyle(
                  color: v.contentText,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
