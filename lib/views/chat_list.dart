import 'package:flutter/material.dart';
import 'package:flutter_wechat/app_config.dart';
import 'package:flutter_wechat/utils/Ults.dart' show ChatListClass,mockChatLists;
 
// 定义类型
class _ChatListItems extends StatelessWidget {

  const _ChatListItems({Key key,this.wechatList}):assert(wechatList != null);

  final ChatListClass wechatList;

  @override
  Widget build(BuildContext context) {
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
            child: Image.network(wechatList.avatar,width: Constants.ConversationAvatarSize,height: Constants.ConversationAvatarSize),
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
           Column(
            children: <Widget>[
              Text(wechatList.updateAt, style: AppStyles.DesStyle)
            ],
          )
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
        return _ChatListItems(wechatList:mockChatLists[index]);

      },
      itemCount: mockChatLists.length,
    );
  }
}