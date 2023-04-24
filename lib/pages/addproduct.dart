import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:latihan_flutter/models/product.dart';
import 'package:latihan_flutter/pages/products.dart';
import 'package:latihan_flutter/services/databasehelper.dart';
import 'package:latihan_flutter/theme.dart';


class ProductAdd extends StatefulWidget {
  final Product? product;
  const ProductAdd({super.key, this.product});

  @override
  State<ProductAdd> createState() => _ProductAddState();
}

class _ProductAddState extends State<ProductAdd> {
 final _formKey = GlobalKey<FormState>();
 final titleController = TextEditingController();
 final descController = TextEditingController();
 
 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: biruHitam,
        title: Text('Create Data', style: headLandBold.copyWith(color: Colors.white),),
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
                      return 'Please enter your name.';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                 TextFormField(
                  controller: descController,
                  decoration: InputDecoration(labelText: 'Decription'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your descri.';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                FilledButton(onPressed: () async {
                  if(_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                     String title = titleController.text;
                     String desc = descController.text;
          
                    Product data = Product(title: title, desc: desc);
                    try {
                      await DatabaseHelper.instance.insertProduct(data);
                      title = '';
                      desc = '';
                      Navigator.pop(context);
                    }catch(e) {
                      Text('Gagal tambah data');
                    }
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