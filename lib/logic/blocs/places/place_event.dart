import 'package:equatable/equatable.dart';

abstract class PlaceEvent extends Equatable{
  @override
  List<Object?> get props => [];
}
class GetPlacesEvent extends PlaceEvent{}