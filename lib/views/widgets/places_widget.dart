import 'package:firebase_app/logic/blocs/places/place_bloc.dart';
import 'package:firebase_app/logic/blocs/places/place_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlacesWidget extends StatefulWidget {
  const PlacesWidget({super.key});

  @override
  State<PlacesWidget> createState() => _PlacesWidgetState();
}

class _PlacesWidgetState extends State<PlacesWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaceBloc, PlacesStates>(
      builder: (context, state) {
        if (state is PlacesLoading) {
          return const Center(child: CircularProgressIndicator(),);
        }
        if (state is PlacesSuccess){
          return SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              itemCount: state.places.length,
              itemBuilder: (context, index) {
                final place = state.places[index];
                return Container(
                  margin: EdgeInsets.all(15),
                  width: 188,
                  height: 240,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(place.image),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(59),
                          color: Colors.grey,
                        ),
                        child: Text(
                          place.title,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(59),
                              color: Colors.grey,
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.star, color: Colors.amber),
                                Text(
                                  place.rate,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          );
      }
        return const SizedBox();
      }
    );

  }
}
