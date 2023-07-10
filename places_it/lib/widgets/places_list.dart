import 'package:flutter/material.dart';
import 'package:places_it/models/place.dart';
import 'package:places_it/screens/place_detail.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({
    super.key,
    required this.places,
  });

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return Center(
        child: Text(
          'No places added yet',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      );
    }

    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (ctx, index) {
        final place = places[index];
        return ListTile(
          leading: CircleAvatar(
            radius: 26,
            backgroundImage: FileImage(place.image),
          ),
          title: Text(
            place.title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => PlaceDetailScreen(place: place)
              ),
            );
          },
        );
      },
    );
  }
}
