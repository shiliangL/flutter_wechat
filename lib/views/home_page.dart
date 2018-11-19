import 'package:flutter/material.dart';
import 'package:flutter_wechat/app_config.dart';

enum ActionItems { GROUP_CHAT, ADD_FRIEND, QR_SCAN, PAYMENT, HELP }

class NavigationIconView {
  final BottomNavigationBarItem item;

  NavigationIconView(
      {Key key, String title, IconData icon, IconData activeIcon})
      : item = BottomNavigationBarItem(
          icon: Icon(icon),
          activeIcon: Icon(activeIcon),
          title: Text(title),
          backgroundColor: Colors.white,
        );
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController _pageController;
  int _currentIndex = 0;
  List<NavigationIconView> _navigationViews;
  List<Widget> _pages;

  void initState() {
    super.initState();
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
      Container(color: Colors.green),
      Container(color: Colors.blue),
      Container(color: Colors.brown),
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

    final BottomNavigationBar _bottomNavigationBarItem = BottomNavigationBar(
      fixedColor: const Color(AppColors.TabIconActive),
      items: _navigationViews.map((NavigationIconView view) {
        return view.item;
      }).toList(),
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap:(int index){
        if (index == _currentIndex ) return
        setState((){
          _currentIndex =  index;
        });
        print('$index');
      }
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
      body: PageView.builder(
        itemBuilder: (BuildContext context, int index) {
          return _pages[index];
        },
        controller: _pageController,
        itemCount: _pages.length,
        onPageChanged: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: _bottomNavigationBarItem,
    );
  }
}
