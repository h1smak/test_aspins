class User {
  final String name;
  final bool isPro;
  final double price;
  final String? avatar;

  User({
    required this.name,
    required this.isPro,
    required this.price,
    this.avatar,
  });
}