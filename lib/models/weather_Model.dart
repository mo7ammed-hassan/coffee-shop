class WeatherModel {
  final String name;
  final String region;
  final String country;
  final String text;

  WeatherModel(
      {required this.name,
      required this.region,
      required this.country,
      required this.text});

  factory WeatherModel.fromJson(data) {
    var jsonData = data['location'];
    return WeatherModel(
      name: jsonData['name'],
      region: jsonData['region'],
      country: jsonData['country'],
      text: data['current']['condition']['text'],
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'region $region';
  }
}
