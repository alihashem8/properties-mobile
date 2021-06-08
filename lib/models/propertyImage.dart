
// ignore: camel_case_types
class propertyImage {
  int id;
  int propertyId;
  String imageUrl;

  propertyImage({
    this.id,
    this.propertyId,
    this.imageUrl,
  });
  toJson() => {
  'id': id,
  'propertyId': propertyId,
  'imageUrl': imageUrl,
};
      factory propertyImage.fromJson (Map<String,dynamic> json){
  return new propertyImage(
    id: json['id'] as int,
    propertyId: json ['propertyId'] as int,
    imageUrl: json ['imageUrl'] as String,
  );
}
}
