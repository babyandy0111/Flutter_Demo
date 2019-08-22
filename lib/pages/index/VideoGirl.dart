import 'package:flutter/material.dart';
import 'package:flutter_shop/model/home_model.dart';
import 'package:flutter_shop/widgets/videoplaydetail.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_shop/services/meinv.dart';
import 'package:flutter_shop/utils/screen_util.dart';

class Videogirl extends StatefulWidget {
  final String channel;
  final String keyword;

  Videogirl({Key key, this.channel, this.keyword}) : super(key: key);

  @override
  _VideogirlState createState() => _VideogirlState();
}

class _VideogirlState extends State<Videogirl> {
  List<HomeModel> images = [];

  @override
  Widget build(BuildContext context) {
    return images.length == 0
        ? Center(
            child: CircularProgressIndicator(),
          )
        : StaggeredGridView.countBuilder(
            padding: EdgeInsets.all(0),
            crossAxisCount: 2,
            itemCount: images.length,
            itemBuilder: (BuildContext context, int index) => new Container(
                constraints: BoxConstraints(minHeight: 100),
                //child: Hero(
                  //tag: 'currentimage$index',
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute<Null>(builder: (context) {
                        return VideoPlayerScreen(
                          currentIndex: index,
                          previewlist: images.map((i) => i.previewVideoUrl).toList(),
                          imagelist: images.map((i) => i.previewUrl).toList(),
                          title: images.map((i) => i.title).toList(),
                          keyword: images.map((i) => i.keyword).toList(),
                          vid: images.map((i) => i.vid).toList(),
                        );
                      }));
                    },
                    child: Image.network(
                      images[index].previewUrl,
                      width: ScreenUtil().L(178),
                      height: images[index].height *
                          ScreenUtil().L(178) /
                          images[index].width,
                    ),
                  ),
                //)
            ),
            staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
          );
  }

  getlist() async {
    var data = await getHomeList(widget.keyword, "1", widget.channel);
    images = data.map((i) => HomeModel.fromJSON(i)).toList();
    print(images);
    setState(() {});
  }

  @override
  void initState() {
    getlist();
    super.initState();
  }
}
