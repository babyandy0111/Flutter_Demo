import 'package:flutter_shop/model/home_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

Future<List> getGirlList(String key) async {
  String url =
      'https://m.image.so.com/j?src=imageonebox&q=$key&obx_type=360pic_meinv&pn=250&sn=0';
  var res = await http.get(url);
  if (res.statusCode == 200) {
    //  print(jsonDecode(res.body));
    List items = jsonDecode(res.body)['list'] as List;
    return items;
  } else {
    return [];
  }
}

Future<List> getTabList() async {
  String url = 'https://www.shihjie.com/api/pornchannel.php';
  var res = await http.get(url);
  if (res.statusCode == 200) {
    //print(jsonDecode(res.body)['response']['categories']);
    List items = jsonDecode(res.body)['response']['categories'] as List;
    return items;
  } else {
    return [];
  }
}

Future<List> getVideoList(String CHID) async {
  String url =
      'https://api.avgle.com/v1/videos/1?c=$CHID&type=public&limit=250';
  var res = await http.get(url);
  if (res.statusCode == 200) {
    //print(jsonDecode(res.body)['response']['videos']);
    List items = jsonDecode(res.body)['response']['videos'] as List;
    return items;
  } else {
    return [];
  }
}

Future<List> getVideo(String vid) async {
  String url = 'https://api.avgle.com/v1/video/$vid';
  var res = await http.get(url);
  if (res.statusCode == 200) {
    //print(jsonDecode(res.body)['response']['video']);
    List items = jsonDecode(res.body)['response']['video'];
    return items;
  } else {
    return [];
  }
}

Future<List> getHomeList(String search, String page, String chid) async {
  String url =
      'https://www.shihjie.com/api/getporn.php?page=$page&search=$search&c=$chid';
  var res = await http.get(url);
  if (res.statusCode == 200) {
    //print(jsonDecode(res.body)['response']['video']);
    List items = jsonDecode(res.body)['data'] as List;
    return items;
  } else {
    return [];
  }
}
