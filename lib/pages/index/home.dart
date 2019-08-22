import 'package:flutter/material.dart';
import 'package:flutter_shop/constants/color.dart';
import 'package:flutter_shop/model/tabList.dart';
import 'package:flutter_shop/pages/index/VideoGirl.dart';
import 'package:flutter_shop/pages/index/beautygirl.dart';
import 'package:flutter_shop/services/meinv.dart';
import 'package:flutter_shop/widgets/index.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  List<tabListModel> tabList = [];

  @override
  Widget build(BuildContext context) {
    return tabList.length == 0
        ? Center(
            child: CircularProgressIndicator(),
          )
        : DefaultTabController(
            length: tabList.length,
            initialIndex: 0,
            child: Column(
              children: <Widget>[
                // AppBar
                HomeTopBar(),

                // tab view
                Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  child: TabBar(
                      indicatorColor: KColorConstant.themeColor,
                      indicatorSize: TabBarIndicatorSize.label,
                      isScrollable: true,
                      labelColor: KColorConstant.themeColor,
                      tabs: tabList
                          .map((i) => Container(
                                height: 30.0,
                                child: Tab(text: i.shortname),
                              ))
                          .toList()),
                ),
                Expanded(
                  child: TabBarView(
                    children: tabList
                        .map((i) => Container(
                              child: Videogirl(channel: i.CHID, keyword: i.shortname),
                            ))
                        .toList(),
                  ),
                ),
              ],
            ));
  }

  getTab() async {
    var data = await getTabList();
    tabList = data.map((i) => tabListModel.fromJSON(i)).toList();
    setState(() {});
  }

  @override
  void initState() {
    getTab();
    super.initState();
  }
}
