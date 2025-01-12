class Training {
  final String name;
  final String trainer;
  final String location;
  final String description;
  final String imageUrl;
  bool? isLocation;
  bool? isTrainer;
  bool? isName;

  Training({
    required this.name,
    required this.trainer,
    required this.location,
    required this.description,
    required this.imageUrl,
    this.isLocation = false,
    this.isName = false,
    this.isTrainer = false,
  });
}