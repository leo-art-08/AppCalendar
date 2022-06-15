class Clothes {
  late final String name, imagePath, style, color, season;

  Clothes(
      {required this.imagePath,
      required this.name,
      required this.style,
      required this.season,
      required this.color});
}

final clothe = [
  Clothes(
      imagePath: "assets/p1.jpg",
      name: "Name:",
      style: "Style:",
      color: "color:",
      season: "season:"),
  Clothes(
      imagePath: "assets/p2.jpg",
      name: "Name",
      style: "style",
      color: "color",
      season: "season"),
  Clothes(
      imagePath: "assets/p3.jpg",
      name: "Name",
      style: "style",
      color: "color",
      season: "season"),
  Clothes(
      imagePath: "assets/profile_1.jpg",
      name: "Name",
      style: "style",
      color: "color",
      season: "season"),
  Clothes(
      imagePath: "assets/profile_1.jpg",
      name: "Name",
      style: "style",
      color: "color",
      season: "season"),
];
