import 'dart:io';
import 'package:damta/domain/enum/module_type_enum.dart';
import 'package:damta/presentation/home/view/widgets/modules/anon_board_module.dart';
import 'package:damta/presentation/home/view/widgets/modules/lunch_module.dart';
import 'package:damta/presentation/home/view/widgets/modules/memo_module.dart';
import 'package:damta/presentation/home/view/widgets/modules/photo_module.dart';
import 'package:damta/presentation/home/view/widgets/modules/schedule_module.dart';
import 'package:damta/presentation/home/view/widgets/modules/timetable_module.dart';
import 'package:damta/presentation/home/view/widgets/modules/weather_module.dart';
import 'package:damta/presentation/home/module_item.dart';
import 'package:flutter/material.dart';

class ModuleBuilder {
  static Widget buildModule({
    required ModuleItem module,
    required bool isEditMode,
    required VoidCallback onDelete,
  }) {
    switch (module.type) {
      case ModuleType.weather:
        return const WeatherModule();

      case ModuleType.photo:
        return PhotoModule(
          path: module.photoPath!,
          showDelete: isEditMode,
          onDelete: onDelete,
        );

      case ModuleType.lunch:
        return const MealModule();

      case ModuleType.timetable:
        return const TimetableModule();

      case ModuleType.schedule:
        return const ScheduleModule();

      case ModuleType.memo:
        return const MemoModule();

      case ModuleType.anonBoard:
        return Platform.isIOS
            ? const SizedBox.shrink()
            : const AnonBoardModule();
    }
  }
}
