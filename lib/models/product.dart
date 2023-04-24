class Product {
  int? id;
  final String title;
  final String desc;
  
  Product({this.id, required this.title,required this.desc});


  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['title'] = title;
    map['desc'] = desc;
    return map;
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      title: map['title'],
      desc: map['desc'],
    );
  }


} 