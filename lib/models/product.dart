class Product {
  int? id;
  final String title;
  final String desc;
  final String image;
  final double price;
 
  Product({
    this.id,
    required this.title,
    required this.desc,
    required this.image,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['title'] = title;
    map['desc'] = desc;
    map['image'] = image;
    map['price'] = price;
    return map;
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      title: map['title'],
      desc: map['desc'],
      image: map['image'],
      price: map['price'],
    );
  }
}
