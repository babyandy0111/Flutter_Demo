class tabListModel {
  String CHID;
  String name;
  String slug;
  String shortname;
  String categoryUrl;
  String coverUrl;
  int totalVideos;

  tabListModel({this.CHID, this.name, this.slug, this.shortname, this.categoryUrl, this.coverUrl, this.totalVideos});

  tabListModel.fromJSON(dynamic json) {
    this.CHID = json['CHID'];
    this.name = json['name'];
    this.slug = json['slug'];
    this.shortname = json['shortname'];
    this.categoryUrl = json['category_url'];
    this.coverUrl = json['cover_url'];
    this.totalVideos = json['total_videos'];
  }
}
