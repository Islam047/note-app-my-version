

import 'package:note_app_mine/menu/all_notes_menu.dart';
import 'package:note_app_mine/menu/create_note_menu.dart';
import 'package:note_app_mine/menu/edit_note_menu.dart';
import 'package:note_app_mine/menu/home_menu.dart';
import 'package:note_app_mine/menu/select_delete_menu.dart';
import 'package:note_app_mine/menu/view_one_note_menu.dart';
import 'package:note_app_mine/services/lang_service.dart';
import 'package:note_app_mine/services/note_service.dart';

void main() async {
  MyApp(
    home: HomeMenu(),
    locale: await LangService.currentLanguage(),
    routes: {

      HomeMenu.id: HomeMenu(),
      CreateNoteMenu.id: CreateNoteMenu(),
      AllNotesMenu.id: AllNotesMenu(),
      ViewOneNoteMenu.id: ViewOneNoteMenu(),
      EditNoteMenu.id: EditNoteMenu(),
      SelectDeleteMenu.id: SelectDeleteMenu(),
    },
  );
}