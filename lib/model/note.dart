class Note{
  final int? id;
  final String? description;
  Note({this.id,this.description});

  Note.fromMap(Map<String, dynamic> json):
    id = json['id'],
    description = json['description'];
  
  Map<String, dynamic> toMap(){
   return {
    'id':id,
    'description':description
   };

  }
  @override
  String toString() {
    // TODO: implement toString
    return 'Note(id:$id,description: $description)';
      }
  

}