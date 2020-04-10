class Chapter{
  final String id;
  final String name;
  final String courseId;
  final String parentId;
  final String image;
  final String description;
  final DateTime createdAt;

  Chapter parent;
  List<Chapter> children = const [];

  Chapter({this.id, this.name, this.courseId, this.parentId, this.image, this.description, this.createdAt});

 factory Chapter.fromJson(Map<String, dynamic> data) {
   return Chapter(
     id: data['_id'] as String,
     name: data['name'] as String,
     description: data['description'] as String,
     parentId: data['parent_chapter_id'] as String,
     courseId: data['course_id'] as String,
     createdAt: DateTime.tryParse(data['create_date'] as String),
     image: data['image'] as String,
   );
 } 
  
}