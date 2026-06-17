class PlaceModel {
  final String title;
  final String image;
  final String rate;

  PlaceModel({
    required this.title,
    required this.image,
    required this.rate,
  });

  factory PlaceModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return PlaceModel(
      title: json['title'],
      image: json['image'],
      rate: json['rate'],
    );
  }
}