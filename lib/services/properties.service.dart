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
        listingTypeId: 1,
        locationDescription: 'location',
        price: 200,
        roomsNumber: 1,
        image: 'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        showPrice: true,
        updatedAt: new DateTime.now()),
    Property(
        id: 2,
        categoryId: 1,
        contactInfo: 'info2',
        createdAt: new DateTime.now(),
        creatorId: 2,
        description: 'description2',
        listingTypeId: 1,
        locationDescription: 'location2',
        price: 1200,
        roomsNumber: 2,
        showPrice: true,
        image: null,
        updatedAt: new DateTime.now())
  ];

  getAll() {
    return properties;
  }
}
