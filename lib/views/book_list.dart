import 'package:flutter/material.dart';
import 'package:flutter_wechat/app_config.dart';
import 'package:flutter_wechat/model/books.dart';

class _RomItem extends StatelessWidget {
  _RomItem({
    @required this.avatar,
    @required this.title,
    this.groupTitle,
    this.onPressed,
  });

  final String avatar;
  final String title;
  final String groupTitle;
  final VoidCallback onPressed;

  bool get _isNetImgs {
    return this.avatar.startsWith('http') || this.avatar.startsWith('https');
  }

  @override
  Widget build(BuildContext context) {
    Widget avatarItem;
    if (_isNetImgs) {
      avatarItem = Image.network(
        avatar,
        width: Constants.ConversationAvatarSize,
        height: Constants.ConversationAvatarSize,
      );
    } else {
      avatarItem = Image.asset(
        avatar,
        width: Constants.ConversationAvatarSize,
        height: Constants.ConversationAvatarSize,
      );
    }

    return Container(
        margin: const EdgeInsets.only(
            left: 16.0, right: 16.0, top: 6.0, bottom: 10.0),
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(
              width: Constants.DividerWidth,
              color: const Color(AppColors.DividerColor)),
        )),
        child: Row(
          children: <Widget>[
            avatarItem,
            SizedBox(
              width: 10.0,
            ),
            Text(title),
          ],
        ));
  }
}

class BookList extends StatefulWidget {
  _BookListState createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  final BookListsData data = BookListsData.mockList();
  static List<Books> _booklists = [];

  void initState() {
    super.initState();
    _booklists..addAll(data.list)..addAll(data.list)..addAll(data.list);
  }

  Widget _fnColumnItem = Column(children: <Widget>[
    _RomItem(
        avatar: 'assets/images/ic_new_friend.png',
        title: '新的朋友',
        onPressed: () {
          print('添加新朋友。');
        }),
    _RomItem(
        avatar: 'assets/images/ic_group_chat.png',
        title: '群聊',
        onPressed: () {
          print('点击了群聊。');
        }),
    _RomItem(
        avatar: 'assets/images/ic_tag.png',
        title: '标签',
        onPressed: () {
          print('标签。');
        }),
    _RomItem(
        avatar: 'assets/images/ic_public_account.png',
        title: '公众号',
        onPressed: () {
          print('添加公众号。');
        }),
  ]);


  Widget _bookListItems = ListView.builder(
    itemBuilder: (BuildContext context, int index){
        Books _itemData = _booklists[index];
        return _RomItem(
            avatar: _itemData.avatar, title: _itemData.name, groupTitle: null);
      },
  );


  @override
  Widget build(BuildContext context) {

    return ListView(

      children: <Widget>[
          _fnColumnItem,
          // _bookListItems
      ],
    );
    // return Container(
    //   child: Column(
    //     children: <Widget>[
    //       _fnColumnItem,
    //       _bookListItems
    //     ],
    //   ),
    // );
  }
}
