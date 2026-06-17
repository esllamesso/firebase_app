import 'package:equatable/equatable.dart';

abstract class PlacesEvent
    extends Equatable {

  @override
  List<Object?> get props => [];
}

class GetPlacesEvent
    extends PlacesEvent {}