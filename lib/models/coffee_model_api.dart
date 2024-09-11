class CoffeeModelApi {
  final String title;
  final String description;
  final String imageUrl;
  final int id;

  CoffeeModelApi({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.id,
  });

  // return value
  factory CoffeeModelApi.fromJson(data) {
    var jsonData = data[0];
    return CoffeeModelApi(
      title: jsonData['title'],
      description: jsonData['description'],
      imageUrl: jsonData['image'],
      id: jsonData['image'],
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'title = $title';
  }
}
