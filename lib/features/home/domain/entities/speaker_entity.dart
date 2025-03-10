class SpeakerEntity {
  final String id;
  final String name;
  final String photo;
  final String bio;
  final String email;
  final DateTime createdAt;
  final String createdBy;

  const SpeakerEntity({
    required this.id,
    required this.name,
    required this.photo,
    required this.bio,
    required this.email,
    required this.createdAt,
    required this.createdBy,
  });
}
