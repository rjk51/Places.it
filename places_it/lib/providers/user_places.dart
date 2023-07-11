import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:places_it/models/place.dart';

class UserPLacesNotfier extends StateNotifier<List<Place>> {
  UserPLacesNotfier() : super(const []);

  void addPlace(String title, File image, PlaceLocation location) {
    final newPlace = Place(title: title,image: image,location: location);
    state = [newPlace, ...state];
  }
}

final userPlacesProvider =
    StateNotifierProvider<UserPLacesNotfier, List<Place>>(
  (ref) => UserPLacesNotfier(),
);
