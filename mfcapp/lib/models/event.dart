
class Events {
  String date;
  String title;
  String location;
  String description;
  String image;
  String id;

  Events(
      {
      required this.id,
      required this.location,
      required this.description,
      required this.image,
      required this.title,
      required this.date});
  factory Events.fromMap(Map<String, dynamic> json) => Events(
        id : json["id"].toString(),
        location: json["location"],
        description: json["description"],
        image: json["image_url"],
        title: json["title"],
        date: json["created_at"].toString(),
      );

  Map<String, dynamic> toMap() => {
        "location": location,
        "description": description,
        "image_url": image,
        "title": title,
        "created_at": date,
        'id':id,
      };
}