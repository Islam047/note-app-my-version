import 'dart:io';

import 'package:note_app_mine/menu/all_notes_menu.dart';
import 'package:note_app_mine/menu/create_note_menu.dart';
import 'package:note_app_mine/models/menu_model.dart';
import 'package:note_app_mine/services/ext_service.dart';
import 'package:note_app_mine/services/navigation_service.dart';
import 'package:note_app_mine/services/settings/security_settings.dart';

import '../services/io_service.dart';
import '../services/settings/lang_settings.dart';

class HomeMenu extends Menu {
  static const String id = "/home_menu";

  Future<void> selectFunction(String selectedMenu) async {
    switch (selectedMenu) {
      case "I":
        {
          write("\n\n\n\n\n\n");
          await Navigator.push(CreateNoteMenu());
        }
        break;
      case "II":
        {
          write("\n\n\n\n\n\n");
          await Navigator.push(AllNotesMenu());
        }
        break;
      case "III":
        {
          write("\n\n\n\n\n\n");
       await Navigator.push(AppSettings());
        }
        break;
      case "IV":
        exit(0);
      default:
        {
          writeln("error".tr);
        }
    }
  }

  @override
  Future<void> build() async {
    writeln("welcome".tr);
    writeln("I. " + "create_note".tr);
    writeln("II. " + "view_all_notes".tr);
    writeln("III. " + "settings".tr);
    writeln("IV. " + "exit".tr);
    String selectedMenu = read();
    await selectFunction(selectedMenu);
  }
}
