class InfoGetTimeModel {
  final String checkIn;
  final String checkOut;
  final String name;

  InfoGetTimeModel({
    required this.name,
    required this.checkIn,
    required this.checkOut,
  });
  factory InfoGetTimeModel.fromJson(Map<String, dynamic> json) {
    return InfoGetTimeModel(
      checkIn: json['checkIn'],
      checkOut: json['checkOut'],
      name: json['name'],
    );
  }
}
