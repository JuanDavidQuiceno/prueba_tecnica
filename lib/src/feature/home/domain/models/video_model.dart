class VideoModel {
  VideoModel({
    required this.id,
    required this.title,
    required this.description,
    required this.url,
    required this.createdAt,
  });
  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
        id: json['id'] != null ? int.tryParse(json['id'].toString()) ?? 0 : 0,
        title: json['title'] != null ? json['title'].toString() : '',
        description:
            json['description'] != null ? json['description'].toString() : '',
        url: json['url'] != null ? json['url'].toString() : '',
        createdAt: json['created_at'] != null
            ? DateTime.tryParse(json['created_at'].toString()) ?? DateTime.now()
            : DateTime.now(),
      );
  int id;
  String title;
  String description;
  String url;
  DateTime createdAt;

  VideoModel copyWith({
    int? id,
    String? title,
    String? description,
    String? url,
    DateTime? createdAt,
  }) =>
      VideoModel(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        url: url ?? this.url,
        createdAt: createdAt ?? this.createdAt,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'url': url,
        'created_at': createdAt.toIso8601String(),
      };
}
