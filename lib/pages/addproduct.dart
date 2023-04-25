import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:latihan_flutter/models/product.dart';
import 'package:latihan_flutter/pages/products.dart';
import 'package:latihan_flutter/services/databasehelper.dart';
import 'package:latihan_flutter/theme.dart';
import 'package:image_picker/image_picker.dart';

class ProductAdd extends StatefulWidget {
  final Product? product;
  const ProductAdd({Key? key, this.product}) : super(key: key);

  @override
  State<ProductAdd> createState() => _ProductAddState();
}

class _ProductAddState extends State<ProductAdd> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descController = TextEditingController();
  final imageController = TextEditingController();
  final priceController = TextEditingController();

   late File? _getImage;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    setState(() {
      _getImage = File(pickedFile!.path);
    });

    imageController.text = _getImage!.path;
  }

  @override
  void initState() {
    super.initState();
    if (widget.product != null) {
      titleController.text = widget.product!.title;
      descController.text = widget.product!.desc;
      imageController.text = widget.product!.image;
      priceController.text = widget.product!.price.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: biruHitam,
        title: Text(
          'Create Data',
          style: headLandBold.copyWith(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter product name.';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: descController,
                  decoration: InputDecoration(labelText: 'Description'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter product description.';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: imageController,
                        decoration: InputDecoration(labelText: 'Image URL'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter product image URL.';
                          }
                          return null;
                        },
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context){
                            return Container(
                                height: 150.0,
                                child: Column(
                                children: [
                                  ListTile(
                                    leading: Icon(Icons.camera_alt),
                                    title: Text('Camera'),
                                    onTap: () {
                                    _pickImage(ImageSource.camera);
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  leading: Icon(Icons.photo_library),
                                  title: Text('Gallery'),
                                  onTap: () {
                                    _pickImage(ImageSource.gallery);
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    icon: Icon(Icons.add_a_photo),
                    tooltip: 'Add Image',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))
                  ],
                  decoration: InputDecoration(
                      labelText: 'Price',
                      prefixText: '\Rp ',
                      ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter product price.';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                FilledButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        String title = titleController.text;
                        String desc = descController.text;
                        String image = imageController.text;
                        double price = double.parse(priceController.text);

                        Product data = Product(
                            title: title,
                            desc: desc,
                            image: image,
                            price: price);
                      
                          await DatabaseHelper.instance.insertProduct(data);
                          title = '';
                          desc = '';
                          image = '';
                          price = 0;
                          Navigator.pop(context);
                  
                         
                    
                  }

                 

                }, child: Text('Submit'))
              ],
            ),
          )
        )
      ),
    );
  }
}






// try {
//                       await DatabaseHelper.instance.insertProduct(data);
//                       title = '';
//                       desc = '';
//                       Navigator.pop(context);
//                     }catch(e) {
//                       Text('Gagal tambah data');
//                     }
















// class ProductAdd extends StatefulWidget {
//   final Product _product;
//   ProductAdd(this._product);

//   @override
//   State<ProductAdd> createState() => _ProductAddState(this._product);
// }

// class _ProductAddState extends State<ProductAdd> {
//   final Product _product;
//   _ProductAddState(this._product);
//   late final nameController = TextEditingController();
//   final codeController = TextEditingController();
//   final descriptionController = TextEditingController();
//   bool isEditing = false;
//   DatabaseHelper dbHelper = DatabaseHelper();
//   @override
//   Future<void> addOrEditUser() async {
//     String desc = descriptionController.text;
//     String name = nameController.text;
//     String code = codeController.text;

//     if (!isEditing) {
//       Product product =
//           new Product(name: name, code: code, description: desc, category: '');
//       //await addProduct(product);
//       await dbHelper.insertProduct(product);
//     } else {
//       _product.description = desc;
//       _product.code = code;
//       _product.name = name;
//       _product.category = '';
//       //await updateProduct(_product);
//       await dbHelper.updateProduct(_product);
//     }
//     // ignore: use_build_context_synchronously
//     Navigator.pop(context, true);

//     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
//       return ProductPage();
//     }));
//     resetData();
//     setState(() {});
//   }

//   Future<int?> addProduct(Product product) async {
//     return await dbHelper.insertProduct(product);
//   }

//   Future<int?> updateProduct(Product product) async {
//     return await dbHelper.updateProduct(product);
//   }

//   void resetData() {
//     nameController.clear();
//     descriptionController.clear();
//     codeController.clear();
//     isEditing = false;
//   }

//   Widget build(BuildContext context) {
//     nameController.text = widget._product.name;
//     codeController.text = widget._product.code;
//     descriptionController.text = widget._product.description;
//     return Scaffold(
//         resizeToAvoidBottomInset: false,
//         appBar: AppBar(
//           title: Text("Product Page"),
//         ),
//         body: Column(
//           children: <Widget>[
//             Expanded(
//                 child: new Column(
//               children: [
//                 Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Form(
//                         child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                           TextFormField(
//                             controller: nameController,
//                             decoration: const InputDecoration(
//                                 hintText: 'Enter Product name',
//                                 labelText: 'Name Debi'),
//                           ),
//                           TextFormField(
//                             controller: codeController,
//                             inputFormatters: [
//                               FilteringTextInputFormatter.allow(
//                                   RegExp(r'[0-9]')),
//                             ],
//                             decoration: const InputDecoration(
//                                 hintText: 'Enter Product Code',
//                                 labelText: 'Code'),
//                           ),
//                           TextFormField(
//                             controller: descriptionController,
//                             decoration: const InputDecoration(
//                                 hintText: 'Enter Product Description',
//                                 labelText: 'Description'),
//                           ),
//                           Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 new Container(
//                                     margin:
//                                         new EdgeInsets.symmetric(vertical: 10),
//                                     child: new ElevatedButton(
//                                       child: const Text('Submit'),
//                                       onPressed: addOrEditUser,
//                                     )),
//                               ])
//                         ])))
//               ],
//             )),
//           ],
//         ));
//   }
// }