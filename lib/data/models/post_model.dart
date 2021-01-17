class PostModel {
  Map postsJson;

  PostModel(this.postsJson);

  int get id => postsJson['id'];
  String get title => postsJson['title'];
  String get body => postsJson['body'];

  // this code is just diff implementation
  // ctrl + B in the above constructor and switch the usage
  // int id;
  // String title;
  // String body;
  // PostModel.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   title = json['title'];
  //   body = json['body'];
  // }
}
