import 'package:flutter/material.dart';
import 'package:flutter_wechat/app_config.dart';

// 聊天列表类
class ChatListClass {
  // 定义构造 并且初始化
  final String avatar;
  final String title;
  final int titleColor;
  final int type;
  final String des;
  final String updateAt;
  final bool isMute;
  final int unreadMsgCount;
  final bool displayDot;

  const ChatListClass(
      {@required this.avatar,
      @required this.title,
      @required this.type,
      @required this.updateAt,
      this.titleColor: AppColors.TitleTextColor,
      this.des,
      this.isMute: false,
      this.unreadMsgCount: 0,
      this.displayDot: false})
      : assert(avatar != null),
        assert(title != null),
        assert(updateAt != null);

      /**
        * assert断言代码在编译时期如果不符合要求就会报错,提高代码的准确性
      */

  getType() {
    return this.type;
  }

  isFromNet() {
    if (this.avatar.indexOf('http') == 0 || this.avatar.indexOf('https') == 0) {
      return true;
    } else {
      return false;
    }
  }
}

const List<ChatListClass> mockChatLists = [
  const ChatListClass(
    avatar: 'assets/images/ic_file_transfer.png',
    title: '文件传输助手',
    des: '',
    updateAt: '19:56',
    type: 0,
  ),
  const ChatListClass(
    avatar: 'assets/images/ic_tx_news.png',
    title: '腾讯新闻',
    des: '豪车与出租车刮擦 俩车主划拳定责',
    updateAt: '17:20',
    type: 0,
  ),
  const ChatListClass(
    avatar: 'https://ws1.sinaimg.cn/large/0065oQSqgy1fxd7vcz86nj30qo0ybqc1.jpg',
    title: 'lijinshanmx',
    des: '今晚要一起去吃鸡吗？',
    updateAt: '17:56',
    type: 1,
    isMute: true,
    unreadMsgCount: 0,
  ),
  const ChatListClass(
    avatar: 'https://ws1.sinaimg.cn/large/0065oQSqgy1fwyf0wr8hhj30ie0nhq6p.jpg',
    title: 'Tina Morgan',
    des: '晚自习是什么来着？你知道吗，看到的话赶紧回复我',
    updateAt: '17:58',
    type: 1,
    isMute: false,
    unreadMsgCount: 3,
  ),
  const ChatListClass(
    avatar: 'https://ws1.sinaimg.cn/large/0065oQSqgy1fwgzx8n1syj30sg15h7ew.jpg',
    title: 'AnNing',
    titleColor: 0xff586b95,
    des: '周末去爬山',
    updateAt: '17:12',
    type: 1,
  ),
  const ChatListClass(
    avatar: 'https://ws1.sinaimg.cn/large/0065oQSqly1fvexaq313uj30qo0wldr4.jpg',
    title: 'Lily',
    des: '明天去跑步',
    updateAt: '昨天',
    type: 1,
    isMute: false,
    unreadMsgCount: 99,
  ),
  const ChatListClass(
    avatar: 'https://randomuser.me/api/portraits/men/10.jpg',
    title: '汤姆丁',
    des: '今晚要一起去吃肯德基吗？',
    updateAt: '17:56',
    type: 1,
    isMute: true,
    unreadMsgCount: 0,
  ),
  const ChatListClass(
    avatar: 'https://randomuser.me/api/portraits/women/10.jpg',
    title: 'Tina Morgan',
    des: '晚自习是什么来着？你知道吗，看到的话赶紧回复我',
    updateAt: '17:58',
    type: 1,
    isMute: false,
    unreadMsgCount: 3,
  ),
  const ChatListClass(
    avatar: 'https://randomuser.me/api/portraits/women/57.jpg',
    title: 'Lily',
    des: '今天要去运动场锻炼吗？',
    updateAt: '昨天',
    type: 1,
    isMute: false,
    unreadMsgCount: 0,
  ),
  const ChatListClass(
    avatar: 'https://randomuser.me/api/portraits/men/10.jpg',
    title: '汤姆丁',
    des: '今晚要一起去吃肯德基吗？',
    updateAt: '17:56',
    type: 1,
    isMute: true,
    unreadMsgCount: 0,
  ),
  const ChatListClass(
    avatar: 'https://randomuser.me/api/portraits/women/10.jpg',
    title: 'Tina Morgan',
    des: '晚自习是什么来着？你知道吗，看到的话赶紧回复我',
    updateAt: '17:58',
    type: 1,
    isMute: false,
    unreadMsgCount: 1,
  ),
  const ChatListClass(
    avatar: 'https://randomuser.me/api/portraits/women/57.jpg',
    title: 'Lily',
    des: '今天要去运动场锻炼吗？',
    updateAt: '昨天',
    type: 1,
    isMute: false,
    unreadMsgCount: 0,
  ),
];
