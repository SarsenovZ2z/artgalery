import 'package:equatable/equatable.dart';

class ImageEntity extends Equatable {
  final String id;
  final String url;
  final String? description;
  final String username;
  final String name;
  final String userImage;

  const ImageEntity({
    required this.id,
    required this.url,
    required this.description,
    required this.username,
    required this.name,
    required this.userImage,
  });

  @override
  List<Object?> get props => [
        id,
        url,
        description,
        username,
        name,
        userImage,
      ];
}
