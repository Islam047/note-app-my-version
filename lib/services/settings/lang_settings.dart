
import 'dart:io';

import 'package:note_app_mine/models/menu_model.dart';
import 'package:note_app_mine/services/file_service.dart';
import 'package:note_app_mine/services/io_service.dart';
import 'package:note_app_mine/services/lang_service.dart';

class AppSettings extends Menu {
  static const String id = 'app_settings';

  Future<void> langSettings() async {
    FileService fileService = FileService();
    await fileService.init();
    List<FileSystemEntity> files = fileService.directory.listSync();
    if (files.isEmpty) {
      writeln('I  rus');
      writeln('II eng ');
      writeln('III Uzbek');
      String selectedMenu = read();
      await selectLang(selectedMenu);
    }
  }

  Future<void> selectLang(String selectMenu) async {
    switch (selectMenu) {
      case 'I':
        {
          LangService.language = Language.ru;
        }
        break;
      case 'II':
        {
          LangService.language = Language.en;
        }
        break;
      case 'III':
        {
          LangService.language = Language.uz;
        }
        break;
      default:
        {
          print('error');
        }
    }
  }

  @override
  Future<void> build()async {
  await langSettings();
  }
}
