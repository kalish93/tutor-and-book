
class Tutor{

final int? id;
final String name;

Tutor({required this.id,required this.name});


factory Tutor.fromJson(Map<String, dynamic> json){
  return Tutor(id: json['id'], name: json['name']);
}

}