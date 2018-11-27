import 'package:flutter/material.dart';
import 'package:flutter_wechat/app_config.dart';
import 'package:flutter_wechat/utils/Ults.dart' show ChatListClass,mockChatLists,Device;
 
// 定义类型
class _ChatListItems extends StatelessWidget {

  const _ChatListItems({Key key,this.wechatList}):assert(wechatList != null);

  final ChatListClass wechatList;

  @override
  Widget build(BuildContext context) {

    Widget avatarImg;

    //通过不同类型判断
    // if (wechatList.getType()==0){
    //   avatarImg = Image.asset(
    //     wechatList.avatar,
    //     width: Constants.ConversationAvatarSize,
    //     height: Constants.ConversationAvatarSize
    //   );
    // }else{
    //     avatarImg = Image.network(
    //     wechatList.avatar,
    //     width: Constants.ConversationAvatarSize,
    //     height: Constants.ConversationAvatarSize
    //   );
    // }

    //通过不同url判断
    if (!wechatList.isFromNet()){
      avatarImg = Image.asset(
        wechatList.avatar,
        width: Constants.ConversationAvatarSize,
        height: Constants.ConversationAvatarSize
      );
    }else{
        avatarImg = Image.network(
        wechatList.avatar,
        width: Constants.ConversationAvatarSize,
        height: Constants.ConversationAvatarSize
      );
    }

    // UI 未读消息
    Widget unReadyMsgText = Container(
      width: 20.0,
      height: 20.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Color(AppColors.NotifyDotBg)
      ),
      child: Text(wechatList.unreadMsgCount.toString(),style:AppStyles.UnreadMsgCountDotStyle),
    );

    /** UI 头像+未读消息
     * Stack 堆栈式布局,定位绝对定位
     */
    Widget avatarContainer = Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        avatarImg,
        Positioned(
          right: -6.0,
          top: -6.0,
          child: wechatList.unreadMsgCount> 0 ? unReadyMsgText: Text(''),
        ),
      ],
    );


    // UI 右边勿扰模式图标
    var _rightArea = <Widget>[
      Text(wechatList.updateAt, style: AppStyles.DesStyle),
      SizedBox(height: 10.0),
      Icon(IconData(
        0xe755,
        fontFamily: Constants.IconFontFamily,
      ), color: wechatList.isMute ? Color(AppColors.ConversationMuteIcon) : Colors.transparent , 
      size: Constants.ConversationMuteIconSize)
    ];
    
    return Container(
      /**
       * decoration-修饰器
       */
      decoration: BoxDecoration(
        color: Color(AppColors.ConversationItemBg),
        border: Border(
          bottom: BorderSide(
            color: Color(AppColors.DividerColor), 
            width: Constants.DividerWidth
          )
        )
      ),
      child: Row(
        /**
         * mainAxisAlignmentl类似flexBox的对齐方式-主轴
         */
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        /**
         * crossAxisAlignment-交叉轴
         */
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            // child: avatarImg,
            child: avatarContainer,
          ),
            /**
             * Expanded-可拓展布局最后剩下的才是自己的空间
             */
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(wechatList.title, style: AppStyles.TitleStyle),
                Text(wechatList.des, style: AppStyles.DesStyle)
              ]
            ),
          ),
          Container(width: 10.0),
          Column(
            // children: <Widget>[
            //   Text(wechatList.updateAt, style: AppStyles.DesStyle,overflow: TextOverflow.ellipsis,softWrap: false,)
            // ],
            children: _rightArea,
          )
        ],
      ),
    );
  }
}

// 设备类型
class _DeviceTpye extends StatelessWidget {
 
  const _DeviceTpye({
    this.device: Device.WIN
  }) : 
    assert(device != null);

  final Device device;

  int get iconName {
    return device == Device.WIN ? 0xe75e : 0xe640;
  }

  String get deviceName {
    return device == Device.WIN ? 'Windows' : 'Mac';
  }

  @override
  Widget build(BuildContext context) {
       return Container(
      padding: EdgeInsets.only(left: 24.0, top: 10.0, right: 24.0, bottom: 10.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: Constants.DividerWidth, color: Color(AppColors.DividerColor)
          ),
        ),
        color: Color(AppColors.DeviceInfoItemBg)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(IconData(
            this.iconName,
            fontFamily: Constants.IconFontFamily
          ), size: 24.0, color: Color(AppColors.DeviceInfoItemIcon)),
          SizedBox(width: 16.0),
          Text('$deviceName 微信已登录，手机通知已关闭。', style: AppStyles.DeviceInfoItemTextStyle),
        ],
      ),
    );
  }
}

class ChatList extends StatefulWidget {
  

  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   child: _chatListItems(),
    //   // child: Text('第一章'),
    // );
    return ListView.builder(
      itemBuilder: (BuildContext context, int index){
        // return _ChatListItems(wechatList:mockChatLists[index]);
        if(index == 0) {
          return _DeviceTpye(device: Device.MAC);
        }
        return _ChatListItems(wechatList: mockChatLists[index]);
      },
      itemCount: mockChatLists.length,
    );
  }
}