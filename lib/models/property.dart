
class Property {
  int id;
  String description;
  double price;
  bool showPrice;
  int roomsNumber;
  int creatorId;
  int categoryId;
  int listingTypeId;
  String locationDescription;
  String contactInfo;
  String image;
  DateTime updatedAt;
  DateTime createdAt;

  Property(
      {this.id,
      this.description,
      this.price,
      this.showPrice,
      this.roomsNumber,
      this.creatorId,
      this.categoryId,
      this.listingTypeId,
      this.locationDescription,
      this.contactInfo,
      this.image,
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
  'listingTypeId': listingTypeId,
  'locationDescription': locationDescription,
  'contactInfo': contactInfo,
    'image': image,
  'updatedAt': updatedAt,
  'createdAt': createdAt,

};
      factory Property.fromJson (Map<String,dynamic> json){
  return new Property(
    id: json['id'] as int,
    description: json ['description'] as String,
    price: json ['price'] as double,
    showPrice: json ['showPrice'] as bool,
    roomsNumber: json ['bedroomsNumber'] as int,
    creatorId: json ['userId'] as int,
    categoryId: json ['categoryId'] as int,
    listingTypeId: json ['typeId'] as int,
    locationDescription: json ['locationDiscription'] as String,
    contactInfo: json ['contactInfo'] as String,
    image: json ['image'] as String,
    updatedAt: json ['updatedAt'] as DateTime,
    createdAt: json ['createdAt'] as DateTime,
  );
}
}
