class users {
  int id;
  String name;
  int phoneNumber;
  String email;
  DateTime updatedAt;
  DateTime createdAt;

  users(
      {this.id,
      this.name,
      this.phoneNumber,
      this.email,
      this.updatedAt,
      this.createdAt});

   toJson() => {
  'id': id,
  'name': name,
  'phoneNumber': phoneNumber,
  'email': email,
  'updatedAt': updatedAt,
  'createdAt': createdAt,

};
      factory users.fromJson (Map<String,dynamic> json){
  return new users(
    id: json['id'] as int,
    name: json ['name'] as String,
    phoneNumber: json ['phoneNumber'] as int,
    email: json ['email'] as String,
    updatedAt: json ['updatedAt'] as DateTime,
    createdAt: json ['createdAt'] as DateTime,
  );
}
}
