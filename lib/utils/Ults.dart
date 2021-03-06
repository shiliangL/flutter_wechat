import 'package:flutter/material.dart';
import 'package:flutter_wechat/app_config.dart';


enum Device {
  MAC, 
  WIN
}
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
    des: '未来需要有可以战胜tx的公司',
    updateAt: '17:20',
    type: 0,
  ),
  const ChatListClass(
    avatar: 'assets/images/ic_wx_games.png',
    title: '微信游戏',
    titleColor: 0xff586b95,
    des: '活力全开',
    updateAt: '17:12',
    type: 0,
  ),
  const ChatListClass(
    avatar: 'https://ws1.sinaimg.cn/large/0065oQSqgy1fxd7vcz86nj30qo0ybqc1.jpg',
    title: 'LingN',
    des: '今晚要一起去吃鸡吗？',
    updateAt: '17:56',
    type: 1,
    isMute: true,
    unreadMsgCount: 2,
  ),
  const ChatListClass(
    avatar: 'http://ww1.sinaimg.cn/large/0065oQSqly1fswhaqvnobj30sg14hka0.jpg',
    title: 'YoTina',
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
    avatar: 'http://ww1.sinaimg.cn/large/0065oQSqly1fszxi9lmmzj30f00jdadv.jpg',
    title: 'Ant',
    des: '今晚要一起去吃肯德基吗？',
    updateAt: '17:56',
    type: 1,
    isMute: true,
    unreadMsgCount: 0,
  ),
  const ChatListClass(
    avatar: 'https://randomuser.me/api/portraits/women/10.jpg',
    title: 'MorLi',
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
    avatar: 'https://ww1.sinaimg.cn/large/0065oQSqly1ftdtot8zd3j30ju0pt137.jpg',
    title: 'YANL',
    des: '今晚要一起去吃肯德基吗？',
    updateAt: '17:56',
    type: 1,
    isMute: true,
    unreadMsgCount: 0,
  ),
  const ChatListClass(
    avatar: 'https://randomuser.me/api/portraits/women/10.jpg',
    title: 'Tinan',
    des: '晚自习是什么来着？你知道吗，看到的话赶紧回复我',
    updateAt: '17:58',
    type: 1,
    isMute: false,
    unreadMsgCount: 1,
  ),
  const ChatListClass(
    avatar: 'http://ww1.sinaimg.cn/large/0065oQSqly1fs7l8ijitfj30jg0shdkc.jpg',
    title: 'LilyMe',
    des: '今天要去运动场锻炼吗？',
    updateAt: '昨天',
    type: 1,
    isMute: false,
    unreadMsgCount: 0,
  ),
];

const listClass = {
  'showDevice': false,
  'mockChatLists': mockChatLists
};