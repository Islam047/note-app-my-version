import 'dart:async';

import 'package:note_app_mine/models/menu_model.dart';
import 'package:note_app_mine/services/file_service.dart';
import 'package:note_app_mine/services/navigation_service.dart';

class EditNoteMenu extends Menu {
  static const String id = "/edit_note_menu";
  String? path;

  EditNoteMenu({this.path});

  @override
  Future<void> build() async {
    FileService fileService = FileService();
    await fileService.updateFileFromPath(path!);
    await Navigator.pop();
  }

}
