import 'package:flutter/material.dart';
import 'package:flutter_wechat/views/chat_list.dart';
import 'package:flutter_wechat/app_config.dart';

enum ActionItems { GROUP_CHAT, ADD_FRIEND, QR_SCAN, PAYMENT, HELP }

// 定义一个集合类 NavigationIconView
class NavigationIconView {
  // 构造
  final String _title;
  final IconData _icon;
  final IconData _activeIcon;
  final BottomNavigationBarItem item;

  NavigationIconView(
      {Key key, String title, IconData icon, IconData activeIcon}):
      _title = title,
      _icon = icon,
      _activeIcon = activeIcon,
      item = BottomNavigationBarItem(
          icon: Icon(icon),
          activeIcon: Icon(activeIcon),
          title: Text(title),
          backgroundColor: Colors.white,
        );
        // 备注：分号之后标识对成员变量赋值
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  int _currentIndex = 0;
  PageController _pageController;
  List<NavigationIconView> _navigationViews;
 
  List<Widget> _pages;

  void initState() {
    super.initState();
    print('每次都打印吗？');
    _navigationViews = [
    NavigationIconView(
      title: '微信',
      icon: IconData(
        0xe608,
        fontFamily: Constants.IconFontFamily,
      ),
      activeIcon: IconData(
        0xe603,
        fontFamily: Constants.IconFontFamily,
      ),
    ),
    NavigationIconView(
        title: '通讯录',
        icon: IconData(
          0xe601,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon: IconData(
          0xe656,
          fontFamily: Constants.IconFontFamily,
        )),
    NavigationIconView(
        title: '发现',
        icon: IconData(
          0xe600,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon: IconData(
          0xe671,
          fontFamily: Constants.IconFontFamily,
        )),
    NavigationIconView(
        title: '我',
        icon: IconData(
          0xe6c0,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon: IconData(
          0xe626,
          fontFamily: Constants.IconFontFamily,
        )),
  ];

    _pageController = PageController(initialPage: _currentIndex);

    _pages = [
      ChatList(),
      Container(child: Text('第二章')),
      Container(child: Text('第三章')),
      Container(child: Text('第四章')),
    ];
  }

  // 顶部下拉选择
  Widget _dropDownSelectItem(int iconName, String title) {
    return Row(
      children: <Widget>[
        Icon(
            IconData(
              iconName,
              fontFamily: Constants.IconFontFamily,
            ),
            size: 22.0,
            color: const Color(AppColors.AppBarPopupMenuColor)),
        Container(width: 12.0),
        Text(title,
            style:
                TextStyle(color: const Color(AppColors.AppBarPopupMenuColor))),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    
    //定义底部 tabs组件
    final BottomNavigationBar _bottomNavigationBarItem = BottomNavigationBar(
      /**
       * fixedColor 选中顶部tabBar颜色
       */
        fixedColor: const Color(AppColors.TabIconActive),
        items: _navigationViews.map((NavigationIconView view) {
          return view.item;
        }).toList(),
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          print('$index');
          if (_currentIndex == index) return;
          setState(() {
            _currentIndex = index;
            _pageController.animateToPage(_currentIndex, 
            duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
          });
        });

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        /**
         * elevation 顶部阴影值
         */
        elevation: 0.0,
        actions: <Widget>[
          Container(
            child: IconButton(
              icon: Icon(
                  IconData(
                    0xe65e,
                    fontFamily: Constants.IconFontFamily,
                  ),
                  size: 20.0),
              onPressed: () {
                print("点击了");
              },
            ),
          ),
          Container(
              child: PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<ActionItems>>[
                PopupMenuItem(
                  child: _dropDownSelectItem(0xe69e, "发起群聊"),
                  value: ActionItems.GROUP_CHAT,
                ),
                PopupMenuItem(
                  child: _dropDownSelectItem(0xe638, "添加朋友"),
                  value: ActionItems.ADD_FRIEND,
                ),
                PopupMenuItem(
                  child: _dropDownSelectItem(0xe61b, "扫一扫"),
                  value: ActionItems.QR_SCAN,
                ),
                PopupMenuItem(
                  child: _dropDownSelectItem(0xe62a, "收付款"),
                  value: ActionItems.PAYMENT,
                ),
                PopupMenuItem(
                  child: _dropDownSelectItem(0xe63d, "帮助与反馈"),
                  value: ActionItems.HELP,
                ),
              ];
            },
            icon: Icon(IconData(
              0xe658,
              fontFamily: Constants.IconFontFamily,
            )),
            onSelected: (ActionItems selected) {
              print('点击的是$selected');
            },
          ))
        ],
      ),
      /**
       * PageView 定义可以滑动的组件
       */
      body: PageView.builder(
        itemBuilder: (BuildContext context, int index) {
          return _pages[_currentIndex];
        },
        controller: _pageController,
        itemCount: _pages.length,
        onPageChanged: (int index) {
          print('第一个屏幕$index');
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: _bottomNavigationBarItem,
    );
  }
}
