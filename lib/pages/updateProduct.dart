import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:latihan_flutter/models/product.dart';
import 'package:latihan_flutter/pages/products.dart';
import 'package:latihan_flutter/services/databasehelper.dart';
import 'package:latihan_flutter/theme.dart';


class UpdateProduct extends StatefulWidget {
   final int productId;
  const UpdateProduct({super.key, required this.productId});

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
 final _formKey = GlobalKey<FormState>();
 final titleController = TextEditingController();
 final descController = TextEditingController();
 
 
 @override
  void initState() {
    super.initState();
    getProductData();
  }

  void getProductData() async {
    Product product = await DatabaseHelper.instance.getProductById(widget.productId);
    titleController.text = product.title;
    descController.text = product.desc;
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: biruHitam,
        title: Text('Update Data'),
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
          
                    Product data = Product(id:widget.productId ,title: title, desc: desc);
                    try {
                      await DatabaseHelper.instance.updateProduct(data);
                      title = '';
                      desc = '';
                      Navigator.pop(context);
                    }catch(e) {
                      Text('Gagal update data');
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