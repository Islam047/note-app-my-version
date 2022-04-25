import 'dart:convert';
import 'dart:io';

import 'package:note_app_mine/models/note_model.dart';
import 'package:note_app_mine/services/ext_service.dart';
import 'package:note_app_mine/services/io_service.dart';

class FileService {
  Directory directory = Directory(Directory.current.path + "\\assets\\files");

  Future<void> init() async {
    bool isDirectoryCreated = await directory.exists();
    if(!isDirectoryCreated) {
      await directory.create();
    }
  }

  Future<String> createFile(String title) async {
    File file = File(directory.path + "\\$title.note");
    bool isFileCreated = await file.exists();
    if(isFileCreated) {
      /// this below code will be edited when I set language service
      throw Exception("file_error".tr);
    }
    await file.create();
    return file.path;
  }

  Future<String> writeFile(Note note, String path) async {
    File file = File(path);

    await file.writeAsString(jsonEncode(note.toJson()));
    await file.setLastModified(DateTime.parse(note.time));
    return file.path;
  }

  Future<Note> readFile(String title) async {
    File file = File(directory.path + "\\$title.note");
    bool isFileCreated = await file.exists();
    if(!isFileCreated) {
      /// this below code will be edited when I set language service
      throw Exception("File not found");
    }

    String result = await file.readAsString();
    Note note = Note.fromJson(jsonDecode(result));
    return note;
  }

  Future<Note> readFileFromPath(String path) async {
    File file = File(path);
    String result = await file.readAsString();
    Note note = Note.fromJson(jsonDecode(result));
    return note;
  }

  Future<String> updateFile(String title) async {
    String path = directory.path + "\\$title.note";
    Note note = await readFile(title);

    writeln("O'zgartirmoqchi bo'lingan note:");
    writeln(note);
    writeln("Yanglinishni kiriting:");
    String content = "";
    String exit = "";
    while(exit != "Save") {
      exit = read();
      if(exit == "Save") {
        break;
      }
      content += (exit + "\n");
    }

    note.content = content;
    note.time = DateTime.now().toString();

    return await writeFile(note, path);
  }

  Future<String> updateFileFromPath(String path) async {
    Note note = await readFileFromPath(path);

    writeln("previous_note".tr);
    writeln(note);
    writeln("edit_note".tr);
    String content = "";
    String exit = "";
    while(exit != "save".tr) {
      exit = read();
      if(exit == "save".tr) {
        break;
      }
      content += (exit + "\n");
    }

    note.content = content;
    note.time = DateTime.now().toString();

    return await writeFile(note, path);
  }

  Future<void> deleteFile(String title) async{
    File file = File(directory.path + "/$title.note");
    file.delete();
  }

  Future<void> deleteFileFromPath(String path) async{
    File file = File(path);
    file.delete();
  }

  Future<void> deleteAllFile() async{
    List<FileSystemEntity> list = directory.listSync();
    for(var item in list) {
      await item.delete();
    }
  }
}