import 'package:artgalery/src/features/image/domain/entities/image_entity.dart';

class ImageModel extends ImageEntity {
  const ImageModel({
    required super.id,
    required super.url,
    required super.description,
    required super.username,
    required super.name,
    required super.userImage,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        id: json['id'],
        url: json['urls']['regular'],
        description: json['description'],
        username: json['user']['username'],
        name: json['user']['name'],
        userImage: json['user']['profile_image']['small'],
      );
}
