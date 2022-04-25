import 'package:note_app_mine/services/data_service.dart';

enum Language {
  en,
  ru,
  uz,
}

class LangService {
  static Language _language = Language.uz;
  static final DataService _dataService = DataService();

  static Future<Language> currentLanguage() async {
    await _dataService.init();
    var result = await _dataService.readData(key: 'language');
    if (result != null) {
      _language = _stringToLanguage(result);
    }
    return _language;
  }

  static set language(Language language) {
    _language = language;
    _dataService.storeData(key: 'language', value: _language.name);
  }

  static Language get language => _language;

  static Language _stringToLanguage(String lang) {
    switch (lang) {
      case 'en':
        return Language.en;
      case 'ru':
        return Language.ru;
      case 'uz':
        return Language.uz;
      default:
        return Language.uz;
    }
  }
}
