
class categories {
  int id;
  String title;

  categories(
      {this.id,
      this.title,
});
toJson() => {
  'id':  id,
  'title': title,
};

factory categories.fromJson (Map<String,dynamic> json){
  return new categories(
    id: json['id'] as int,
    title: json ['title'] as String,
  );
}
}
