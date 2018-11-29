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

    // 分组
    Widget groupItems = Row(children: <Widget>[
      avatarItem,
      SizedBox(
        width: 10.0,
      ),
      Text(title),
    ]);

    // 分组是否有字母标识
    Widget groupItemsIsL;
    if (this.groupTitle != null) {
      groupItemsIsL = Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 4.0, bottom: 4.0),
            color: const Color(AppColors.ContactGroupTitleBg),
            alignment: Alignment.centerLeft,
            child: Text(this.groupTitle, style: AppStyles.GroupTitleItemTextStyle),
          ),
          groupItems
        ],
      );
    } else {
      groupItemsIsL = groupItems;
    }

    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0),
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(
              width: Constants.DividerWidth,
              color: const Color(AppColors.DividerColor)),
        )),
        child: groupItemsIsL,
    );
  }
}

class BookList extends StatefulWidget {
  _BookListState createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  final BookListsData data = BookListsData.mockList();
  final List<Books> _booklists = [];
  final List<_RomItem> _fnItems = [
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
  ];

  void initState() {
    super.initState();
    _booklists..addAll(data.list)..addAll(data.list)..addAll(data.list);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
       
       bool _isGroupTitle = true;

        if (index < _fnItems.length) {
          _isGroupTitle = false;
          return _fnItems[index];
        }else{
          _isGroupTitle = true;
        }

        int _totalIndex = index - _fnItems.length;
        Books _itemData = _booklists[_totalIndex];
 

        return _RomItem(
            avatar: _itemData.avatar, 
            title: _itemData.name, 
            groupTitle: _isGroupTitle ?  _itemData.nameIndex : null
        );
      },
      itemCount: _fnItems.length + _booklists.length,
    );
    ;
  }
}
