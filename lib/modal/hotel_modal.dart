
import 'package:travelbuddy/modal/activity_modal.dart';

class Hotel {
  String imageUrl;
  String name;
  String address;
  int price;
  List<Activity> activities1;

  Hotel({
    required this.imageUrl,
    required this.name,
    required this.address,
    required this.price,
    required this.activities1
  });
}



List<Activity> activities = [
  Activity(
    imageUrl: 'assets/hotelin1.jpg',
    name: 'St. Mark\'s Basilica',
    type: 'Sightseeing Tour',
    startTimes: ['9:00 am', '11:00 am'],
    rating: 5,
    price: 30,
  ),
  Activity(
    imageUrl: 'assets/hotelin2.jpg',
    name: 'Walking Tour and Gonadola Ride',
    type: 'Sightseeing Tour',
    startTimes: ['11:00 pm', '1:00 pm'],
    rating: 4,
    price: 210,
  ),
  Activity(
    imageUrl: 'assets/hotelin3.jpg',
    name: 'Murano and Burano Tour',
    type: 'Sightseeing Tour',
    startTimes: ['12:30 pm', '2:00 pm'],
    rating: 3,
    price: 125,
  ),
  Activity(
    imageUrl: 'assets/hotelin4.jpg',
    name: 'Walking Tour and Gonadola Ride',
    type: 'Sightseeing Tour',
    startTimes: ['11:00 pm', '1:00 pm'],
    rating: 4,
    price: 250,
  ),
  Activity(
    imageUrl: 'assets/hotelin5.jpg',
    name: 'Walking Tour and Gonadola Ride',
    type: 'Sightseeing Tour',
    startTimes: ['1:00 pm', '3:00 pm'],
    rating: 4,
    price: 175,
  ),
  Activity(
    imageUrl: 'assets/hotelin2.jpg',
    name: 'Walking Tour and Gonadola Ride',
    type: 'Sightseeing Tour',
    startTimes: ['3:00 pm', '6:00 pm'],
    rating: 4,
    price: 175,
  ),
];





 final List<Hotel> hotels = [
  Hotel(
    imageUrl: 'assets/hotel1.jpg',
    name: 'Hotel ',
    address: '404 Great St',
    price: 300,
    activities1: activities,
  ),
  Hotel(
    imageUrl: 'assets/ho2.jpg',
    name: 'Hotel ',
    address: '404 Great St',
    price: 240,
    activities1: activities,
  ),
  Hotel(
    imageUrl: 'assets/hotel0.jpg',
    name: 'Hotel ',
    address: '404 Great St',
    price: 175,
    activities1: activities,
  ),
  Hotel(
    imageUrl: 'assets/hotel3.jpg',
    name: 'Hotel ',
    address: '404 Great St',
    price: 175,
    activities1: activities,
  ),
  Hotel(
    imageUrl: 'assets/ho4.jpg',
    name: 'Hotel ',
    address: '404 Great St',
    price: 175,
    activities1: activities,
  ),
];

