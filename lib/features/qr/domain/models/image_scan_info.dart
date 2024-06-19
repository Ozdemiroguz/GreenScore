class ImageScanInfo {
  final bool recycleBool;
  final String category;
  final String title;
  final String desc;

  ImageScanInfo({
    required this.recycleBool,
    required this.category,
    required this.title,
    required this.desc,
  });

  factory ImageScanInfo.fromJson(Map<String, dynamic> json) {
    return ImageScanInfo(
        recycleBool: json['recycleBool'],
        category: json['category'],
        title: json['title'],
        desc: json['desc']);
  }
}
