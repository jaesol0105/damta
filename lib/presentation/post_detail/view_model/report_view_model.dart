import 'package:damta/core/di/provider.dart';
import 'package:damta/domain/entity/report_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'report_view_model.g.dart';

@riverpod
class ReportViewModel extends _$ReportViewModel {
  @override
  AsyncValue<void> build() => const AsyncData(null);

  Future<void> submitReport(ReportEntity reportEntity) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final usecase = ref.read(reportUsecaseProvider);
      await usecase.submitReport(reportEntity);
    });
  }
}
