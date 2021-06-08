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
        price: 20012,
        roomsNumber: 1,
        image: 'https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        showPrice: false,
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
        image: 'https://th.bing.com/th/id/R220965b6574a3f7a3001116ed4b98a31?rik=xk98JDwYErqNbg&pid=ImgRaw',
        updatedAt: new DateTime.now())
  ];

  getAll() {
    return properties;
  }
}
