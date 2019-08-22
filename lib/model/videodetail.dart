class Videodetail {
  String title;
  String keyword;
  String channel;
  String videoUrl;
  String embeddedUrl;
  String previewUrl;
  String previewVideoUrl;
  String vid;
  String uid;
  bool hd;
  bool private;
  int addtime;
  int viewnumber;
  int likes;
  int dislikes;

  Videodetail(
      {this.title,
      this.keyword,
      this.channel,
      this.videoUrl,
      this.embeddedUrl,
      this.previewUrl,
      this.previewVideoUrl,
      this.vid,
      this.uid,
      this.hd,
      this.private,
      this.addtime,
      this.viewnumber,
      this.likes,
      this.dislikes});

  Videodetail.fromJSON(Map<String, dynamic> json) {
    this.title = json['title'];
    this.keyword = json['keyword'];
    this.channel = json['channel'];
    this.videoUrl = json['video_url'];
    this.embeddedUrl = json['embedded_url'];
    this.previewUrl = json['preview_url'];
    this.previewVideoUrl = json['preview_video_url'];
    this.vid = json['vid'];
    this.uid = json['uid'];
    this.hd = json['hd'];
    this.private = json['private'];
    this.addtime = json['addtime'] as int;
    this.viewnumber = json['viewnumber'] as int;
    this.likes = json['likes'] as int;
    this.dislikes = json['dislikes'] as int;
  }
}
