class  Course {
  final String id;
  final String name;
  final String description;
  final String icon;
  final DateTime createdAt;

  Course({this.id, this.name, this.description, this.icon, this.createdAt}); 


 factory Course.fromJson(Map<String, dynamic> data) {
   return Course(
     id: data['_id'] as String,
     name: data['name'] as String,
     description: data['description'] as String,
     icon: data['icon'] as String,
     createdAt: DateTime.tryParse(data['create_date'] as String),
   );
 } 
}