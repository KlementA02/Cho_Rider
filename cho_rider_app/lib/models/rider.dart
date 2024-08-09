class Rider {
  final String id;
  final String name;
  final String phoneNumber;
  final String password;
  final bool isActive;
  final String profilePictureUrl;
  final DateTime joinedDate;

  Rider(
      {required this.id,
      required this.name,
      required this.phoneNumber,
      required this.password,
      required this.isActive,
      required this.profilePictureUrl,
      required this.joinedDate});

  // Method to create a Rider instance from a map (useful for JSON deserialization)
  factory Rider.fromMap(Map<String, dynamic> map) {
    return Rider(
        id: map['id'],
        name: map['name'],
        phoneNumber: map['contact_number'],
        password: map['password'],
        isActive: map['status'],
        profilePictureUrl: map['image'],
        joinedDate: map['createdAt']);
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
