import 'package:equatable/equatable.dart';

class ImageEntity extends Equatable {
  final String id;
  final String url;

  const ImageEntity({
    required this.id,
    required this.url,
  });

  @override
  List<Object?> get props => [
        id,
        url,
      ];
}
