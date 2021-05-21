
class properties {
  int id;
  String description;
  double price;
  double showPrice;
  int roomsNumber;
  int creatorId;
  int categoryId;
  int listingtypeId;
  String locationDiscription;
  String contactInfo;
  String isSold;
  DateTime updatedAt;
  DateTime createdAt;

  properties(
      {this.id,
      this.description,
      this.price,
      this.showPrice,
      this.roomsNumber,
      this.creatorId,
      this.categoryId,
      this.listingtypeId,
      this.locationDiscription,
      this.contactInfo,
      this.isSold,
      this.updatedAt,
      this.createdAt});

  toJson() => {
  'id':  id,
  'description': description,
  'price': price,
  'showPrice': showPrice,
  'roomsNumber': roomsNumber,
  'creatorId': creatorId,
  'categoryId': categoryId,
  'listingtypeId': listingtypeId,
  'locationDiscription': locationDiscription,
  'contactInfo': contactInfo,
  'isSold': isSold,
  'updatedAt': updatedAt,
  'createdAt': createdAt,

};
      factory properties.fromJson (Map<String,dynamic> json){
  return new properties(
    id: json['id'] as int,
    description: json ['description'] as String,
    price: json ['price'] as double,
    showPrice: json ['showPrice'] as double,
    roomsNumber: json ['roomsNumber'] as int,
    creatorId: json ['creatorId'] as int,
    categoryId: json ['categoryId'] as int,
    listingtypeId: json ['listingtypeId'] as int,
    locationDiscription: json ['locationDiscription'] as String,
    contactInfo: json ['contactInfo'] as String,
    isSold: json ['isSold'] as String,
    updatedAt: json ['updatedAt'] as DateTime,
    createdAt: json ['createdAt'] as DateTime,
  );
}
}
