import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:places_it/widgets/places_list.dart';
import 'package:places_it/screens/add_place.dart';
import 'package:places_it/providers/user_places.dart';

class Places extends ConsumerStatefulWidget {
  const Places({super.key});

  @override
  ConsumerState<Places> createState() => _PlacesState();
}

class _PlacesState extends ConsumerState<Places> {
  late Future<void> _placesFuture;

  @override
  void initState() {
    super.initState();
    _placesFuture = ref.read(userPlacesProvider.notifier).loadPlaces();
  }

  @override
  Widget build(BuildContext context) {
    final userPlaces = ref.watch(userPlacesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => const AddPlaceScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: _placesFuture,
          builder: (ctx, snapshot) => snapshot.connectionState == ConnectionState.waiting
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : PlacesList(
                places: userPlaces,
              ),
          ) 
        ),
    );
  }
}