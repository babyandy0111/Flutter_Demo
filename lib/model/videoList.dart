class VideogirlModel {
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

  VideogirlModel(
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

  VideogirlModel.fromJSON(dynamic json)
      : title = json['title'],
        keyword = json['keyword'],
        channel = json['channel'],
        videoUrl = json['video_url'],
        embeddedUrl = json['embedded_url'],
        previewUrl = json['preview_url'],
        previewVideoUrl = json['preview_video_url'],
        vid = json['vid'],
        uid = json['uid'],
        hd = json['hd'],
        private = json['private'],
        addtime = json['addtime'] as int,
        viewnumber = json['viewnumber'] as int,
        likes = json['likes'] as int,
        dislikes = json['dislikes'] as int;
}
