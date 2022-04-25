import 'dart:convert';

class Note {
  late String title;
  late String content;
  late String time;

  Note({required this.title, required this.content}) {
    time = DateTime.now().toString();
  }

  Note.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    content = json['content'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'title': title,
      'content': content,
      'time': time,
    };
    return map;
  }

  @override
  String toString() {
    return 'title: $title\nContent: $content';
  }
}
