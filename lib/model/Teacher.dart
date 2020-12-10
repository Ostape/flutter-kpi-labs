class Teacher {
  final int userId;
  final String phone;
  final String email;

  Teacher({
    this.userId,
    this.phone,
    this.email,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(
      userId: json['id'],
      phone: json['phone'],
      email: json['email'],
    );
  }
}
