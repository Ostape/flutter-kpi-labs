class Teacher {
  final String name;
  final int userId;
  final String phone;
  final String email;

  Teacher({
    this.name,
    this.userId,
    this.phone,
    this.email,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(
      name: json['firstName'],
      userId: json['id'],
      phone: json['phone'],
      email: json['email'],
    );
  }
}
