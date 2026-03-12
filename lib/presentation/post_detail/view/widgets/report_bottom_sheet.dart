import 'package:damta/core/theme/app_theme.dart';
import 'package:damta/domain/entity/report_entity.dart';
import 'package:damta/domain/enum/report_reason_enum.dart';
import 'package:damta/domain/enum/report_target_type_enum.dart';
import 'package:damta/presentation/post_detail/view_model/report_view_model.dart';
import 'package:damta/presentation/widget/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ReportBottomSheet extends HookConsumerWidget {
  const ReportBottomSheet({
    super.key,
    required this.reporterUid,
    required this.targetType,
    required this.targetId,
    required this.targetUid,
    required this.schoolCode,
  });

  final String reporterUid;
  final ReportTargetType targetType;
  final String targetId;
  final String targetUid;
  final String schoolCode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedReason = useState<ReportReason?>(null);
    final reportState = ref.watch(reportViewModelProvider);
    final isLoading = reportState is AsyncLoading;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 36),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 8),
            child: Text(
              '신고 사유 선택',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: vrc(context).labelText,
              ),
            ),
          ),
          ...ReportReason.values.map(
            (reason) => RadioListTile<ReportReason>(
              dense: true,
              contentPadding: EdgeInsets.zero,
              title: Text(reason.label),
              value: reason,
              groupValue: selectedReason.value,
              onChanged: isLoading ? null : (v) => selectedReason.value = v,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: (selectedReason.value == null || isLoading)
                  ? null
                  : () async {
                      await ref
                          .read(reportViewModelProvider.notifier)
                          .submitReport(
                            ReportEntity(
                              reporterUid: reporterUid,
                              targetType: targetType,
                              targetId: targetId,
                              targetUid: targetUid,
                              reason: selectedReason.value!,
                              schoolCode: schoolCode,
                              rCreatedAt: DateTime.now(),
                            ),
                          );
                      if (!context.mounted) return;
                      final state = ref.read(reportViewModelProvider);
                      Navigator.of(context).pop();
                      if (!context.mounted) return;
                      if (state is AsyncData) {
                        showCustomSnackBar(
                          context: context,
                          message: '신고가 접수되었습니다.',
                        );
                      } else if (state is AsyncError) {
                        showCustomSnackBar(
                          context: context,
                          message: state.error.toString().replaceAll(
                            'Exception: ',
                            '',
                          ),
                        );
                      }
                    },
              child: isLoading
                  ? const SizedBox(
                      height: 18,
                      width: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('신고하기'),
            ),
          ),
        ],
      ),
    );
  }
}
