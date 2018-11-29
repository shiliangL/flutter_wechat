import 'package:flutter/material.dart';

// 定义一个类型
class ListItem {
  final String title;
  final IconData iconData;

  ListItem(this.title, this.iconData);
}

class ListItemWidget extends StatelessWidget {
  final ListItem listItem;

  ListItemWidget(this.listItem);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(listItem.iconData),
      title: Text(listItem.title),
    );
  }
}


// 主体
class FoundList extends StatefulWidget {
  _FoundListState createState() => _FoundListState();
}

class _FoundListState extends State<FoundList> {
  final List<ListItem> listData = [];

  void initState() {
    super.initState();
    for (var i = 0; i < 20; i++) {
      listData.add(ListItem("我是测试标题$i", Icons.toc));
    }
  }

  @override
  Widget build(BuildContext context) {
     return new Scaffold(
      body: new ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return new ListItemWidget(listData[index]);
        },
        itemCount: listData.length,
      ),
    );
  }
}
