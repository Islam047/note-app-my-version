import 'package:note_app_mine/services/lang_service.dart';
import 'package:note_app_mine/services/locals/enUs.dart';
import 'package:note_app_mine/services/locals/ruRu.dart';
import 'package:note_app_mine/services/locals/uzUz.dart';

extension ExtString on String {
  String get tr {
    switch (LangService.language) {
      case Language.uz:
        return uzUZ[this] ?? this;
      case Language.ru:
        return ruRU[this] ?? this;
      case Language.en:
        return enUS[this] ?? this;
    }
  }

  int get toInt {
    return int.tryParse(this) ?? 0;
  }

  double get toDouble {
    return double.tryParse(this) ?? 0;
  }

  bool get toBool {
    if (this == 'true') {
      return true;
    } else {
      return false;
    }
  }
}
