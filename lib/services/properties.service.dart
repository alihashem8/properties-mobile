import 'package:test_flutter/models/property.dart';

class PropertiesServices {
  var properties = [
    Property(
        id: 1,
        categoryId: 1,
        contactInfo: 'info',
        createdAt: new DateTime.now(),
        creatorId: 1,
        description: 'description',
        isSold: false,
        listingtypeId: 1,
        locationDiscription: 'location',
        price: 200,
        roomsNumber: 1,
        showPrice: true,
        updatedAt: new DateTime.now()),
    Property(
        id: 2,
        categoryId: 1,
        contactInfo: 'info2',
        createdAt: new DateTime.now(),
        creatorId: 2,
        description: 'description2',
        isSold: false,
        listingtypeId: 1,
        locationDiscription: 'location2',
        price: 1200,
        roomsNumber: 2,
        showPrice: true,
        updatedAt: new DateTime.now())
  ];

  getAll() {
    return properties;
  }
}
