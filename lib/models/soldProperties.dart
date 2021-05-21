
class soldProperties {
  int id;
  int propertyId;
  int userId;
  DateTime updatedAt;
  DateTime createdAt;

  soldProperties(
      {this.id,
      this.propertyId,
      this.userId,
      this.updatedAt,
      this.createdAt});
toJson() => {
  'id':  id,
  'propertyId': propertyId,
  'userId': userId,
  'updatedAt': updatedAt,
  'createdAt': createdAt,
};
      factory soldProperties.fromJson (Map<String,dynamic> json){
  return new soldProperties(
    id: json['id'] as int,
    propertyId: json ['propertyId'] as int,
    userId: json ['userId'] as int,
    updatedAt: json ['updatedAt'] as DateTime,
    createdAt: json ['createdAt'] as DateTime,
  );
}
}
