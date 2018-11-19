import 'package:flutter/material.dart';
import 'package:flutter_wechat/app_config.dart';

// 聊天列表类
class ChatList {
  
  final String avatar;
  final String title;
  final int titleColor;
  final int type;
  final String des;
  final String updateAt;
  final bool isMute;
  final int unreadMsgCount;
  final bool displayDot;

 const ChatList({
    @required this.avatar,
    @required this.title,
    @required this.type,
    @required this.updateAt,
    this.titleColor : AppColors.TitleTextColor,
    this.des,
    this.isMute : false,
    this.unreadMsgCount : 0,
    this.displayDot : false
  }) : assert(avatar != null),
       assert(title != null),
       assert(updateAt != null);
}