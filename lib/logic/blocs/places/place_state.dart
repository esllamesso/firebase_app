import 'package:equatable/equatable.dart';

import '../../../data/place_model.dart';

abstract class PlacesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PlacesInitial extends PlacesState {}

class PlacesLoading extends PlacesState {}

class PlacesSuccess extends PlacesState {
  final List<PlaceModel> places;

  PlacesSuccess(this.places);

  @override
  List<Object?> get props => [places];
}

class PlacesError extends PlacesState {
  final String message;

  PlacesError(this.message);

  @override
  List<Object?> get props => [message];
}
