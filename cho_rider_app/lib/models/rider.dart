class Rider {
  final String id;
  final String name;
  final String phoneNumber;
  final String email;
  final double rating;
  final int completedDeliveries;
  final String status;
  final String profilePictureUrl;
  final DateTime joinedDate;

  Rider(
      {required this.id,
      required this.name,
      required this.phoneNumber,
      required this.email,
      required this.rating,
      required this.completedDeliveries,
      required this.status,
      required this.profilePictureUrl,
      required this.joinedDate});

  // Method to create a Rider instance from a map (useful for JSON deserialization)
  factory Rider.fromMap(Map<String, dynamic> map) {
    return Rider(
      id: map['id'],
      name: map['name'],
      phoneNumber: map['phoneNumber'],
      email: map['email'],
      rating: map['rating'],
      completedDeliveries: map['completedDeliveries'],
      status: map['status'],
      profilePictureUrl: map['profilePictureUrl'],
      joinedDate: DateTime.parse(map['joinedDate']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phoneNumber': phoneNumber,
      'email': email,
      'rating': rating,
      'completedDeliveries': completedDeliveries,
      'status': status,
      'profilePictureUrl': profilePictureUrl,
      'joinedDate': joinedDate.toIso8601String(),
    };
  }
}
