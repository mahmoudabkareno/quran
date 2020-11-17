class Sorah{
  int number;
  String name, englishName;

  Sorah({
    this.name,
    this.number,
    this.englishName
  });

  factory Sorah.fromJson(Map<String, dynamic> json){
    return Sorah(
      name: json['name'],
      englishName: json['englishName'],
      number: json['number'],
    );
  }
}