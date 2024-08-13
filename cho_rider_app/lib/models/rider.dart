class Rider {
  final String id;
  final String name;
  final String phoneNumber;
  final String password;
  final bool isActive;
  final String profilePictureUrl;
  final DateTime joinedDate;

  Rider({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.password,
    required this.isActive,
    required this.profilePictureUrl,
    required this.joinedDate,
  });

  // Method to create a Rider instance from a map (useful for JSON deserialization)
  factory Rider.fromMap(Map<String, dynamic> map) {
    return Rider(
      id: map['id'] as String,
      name: map['name'] as String,
      phoneNumber: map['contact_number'] as String? ?? '',
      password: map['password'] as String? ?? '',
      isActive: map['status'] as bool? ?? false,
      profilePictureUrl: map['image'] as String? ?? '',
      joinedDate: DateTime.parse(
          map['createdAt'] as String? ?? DateTime.now().toIso8601String()),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'contact_number': phoneNumber,
      'password': password,
      'status': isActive,
      'image': profilePictureUrl,
      'createdAt': joinedDate.toIso8601String(),
    };
  }
}
