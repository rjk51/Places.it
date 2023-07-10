import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:places_it/models/place.dart';

class UserPLacesNotfier extends StateNotifier<List<Place>> {
  UserPLacesNotfier() : super(const []);

  void addPlace(String title) {
    final newPlace = Place(title: title);
    state = [newPlace,...state];
  }
}

final userPlacesProvider = StateNotifierProvider<UserPLacesNotfier, List<Place>>(
  (ref) => UserPLacesNotfier(),
);