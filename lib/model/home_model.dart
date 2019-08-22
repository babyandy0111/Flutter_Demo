

class HomeModel {
  int width;
  int height;
  String thumb;
  String title;
  String keyword;
  String previewUrl;
  String previewVideoUrl;
  String vid;

  HomeModel({this.width, this.height, this.thumb, this.title, this.keyword, this.previewUrl, this.previewVideoUrl, this.vid});

  HomeModel.fromJSON(Map<String, dynamic> json) {
    this.width = json['width'] as int;
    this.height = json['height'] as int;
    this.thumb = json['thumb'];
    this.title = json['title'];
    this.keyword = json['keyword'];
    this.previewUrl = json['previewUrl'];
    this.previewVideoUrl = json['previewVideoUrl'];
    this.vid = json['vid'];
  }
}
