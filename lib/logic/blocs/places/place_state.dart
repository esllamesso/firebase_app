import 'package:equatable/equatable.dart';
import 'package:firebase_app/data/place_model.dart';

abstract class PlacesStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class PlacesInitial extends PlacesStates {}

class PlacesLoading extends PlacesStates {}

class PlacesSuccess extends PlacesStates {
  final List<PlaceModel> places;

  PlacesSuccess(this.places);

  @override
  List<Object?> get props => [places];
}

class PlacesError extends PlacesStates {
  final String message;

  PlacesError(this.message);

  @override
  List<Object?> get props => [message];
}
