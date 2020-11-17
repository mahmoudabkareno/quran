class ElFatiha{
  int number;
  String name, text;

  ElFatiha({
    this.name,
    this.number,
    this.text
  });

  factory ElFatiha.fromJson(Map<String, dynamic> json){
    return ElFatiha(
      name: json['name'],
      text: json['text'],
      number: json['number'],
    );
  }
}