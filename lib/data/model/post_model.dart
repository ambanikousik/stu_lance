

import 'package:flutter/material.dart';

class Post {
  String post;
  String user;
  int comment;
  int love;
  int view;


  Post({
  @required this.post,
  @required this.user,
  @required this.comment,
  @required this.love,
  @required this.view,
  }
  );
}