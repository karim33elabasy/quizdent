import 'package:quizdent/features/home/domain/entities/speaker_entity.dart';

class SpeakerModel extends SpeakerEntity {
  SpeakerModel({
    required super.id,
    required super.name,
    required super.photo,
    required super.bio,
    required super.email,
    required super.createdAt,
    required super.createdBy,
  });

  /// تحويل JSON إلى `SpeakerModel`
  factory SpeakerModel.fromJson({required Map<String, dynamic> json, required String id}) {
    return SpeakerModel(
      id: id,
      name: json['name'] as String,
      photo: json['photo'] as String,
      bio: json['bio'] as String,
      email: json['email'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      createdBy: json['createdBy'] as String,
    );
  }

  /// تحويل `SpeakerModel` إلى JSON
  Map<String, dynamic> toJson() {
    return {
      // 'id': id,
      'name': name,
      'photo': photo,
      'bio': bio,
      'email': email,
      'createdAt': createdAt.toIso8601String(),
      'createdBy': createdBy,
    };
  }
}
