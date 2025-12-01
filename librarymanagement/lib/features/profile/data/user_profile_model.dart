class UserProfile {
  final String name;
  final String email;
  final String college;
  final String course;
  final String address;

  UserProfile({
    required this.name,
    required this.email,
    required this.college,
    required this.course,
    required this.address,
  });

  UserProfile copyWith({
    String? name,
    String? email,
    String? college,
    String? course,
    String? address,
  }) {
    return UserProfile(
      name: name ?? this.name,
      email: email ?? this.email,
      college: college ?? this.college,
      course: course ?? this.course,
      address: address ?? this.address,
    );
  }
}
