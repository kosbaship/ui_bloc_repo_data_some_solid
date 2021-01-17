class PostModel {
  Map postsJson;

  PostModel(this.postsJson);

  int get id => postsJson['id'];
  String get title => postsJson['title'];
  String get body => postsJson['body'];
}
