import 'package:flutter/foundation.dart';

class Post extends ChangeNotifier {
  final String userName;
  final String userStatus;
  final String userText;
  final String userAvatar;
  final String userPostImage;

  List comments = [
    "Some comment1",
    "Some comment2",
    "Some comment3",
  ];

  Post({
    this.userName,
    this.userStatus,
    this.userText,
    this.userAvatar,
    this.userPostImage,
  });

  void addComment(String comment) {
    comments.add(comment);
    notifyListeners();
  }
}
