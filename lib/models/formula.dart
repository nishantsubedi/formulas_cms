class Formula {
  final String content;
  final String id;

  Formula({this.content, this.id});

  factory Formula.fromJson(Map<String, dynamic> data) {
    return Formula(
      content: data['content'] as String,
      id: data['_id'] as String,
    );
  }
}
