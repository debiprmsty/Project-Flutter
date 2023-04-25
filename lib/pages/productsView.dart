import 'package:flutter/material.dart';
import 'package:latihan_flutter/theme.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  @override
  Widget build(BuildContext context) {
     double paddingTop = MediaQuery.of(context).padding.top + 10;
     double width = MediaQuery.of(context).size.width;
     double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: paddingTop),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 13),
            child: Column(
              children: [
                Container(
                  width: width,
                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 6),
                  child: Text('Find your best\nfurniture', style: headLandBold.copyWith(fontSize: 23),),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Search ...',
                    hintStyle: const TextStyle(color: Colors.grey),
                    focusColor: Colors.black,
                    contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    )
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
  height: height,
  width: width,
  child: SingleChildScrollView(
    child: GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount:2,
      
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20, // ubah nilai crossAxisSpacing menjadi lebih besar
        mainAxisSpacing: 20,
        childAspectRatio: (width / height),
      ),
      itemBuilder: (BuildContext context, int index) {
        return Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0,2), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  width: width,
                  child: IconButton(onPressed: () {
                    
                  }, icon: Icon(Icons.favorite, size: 20,color: Colors.red)),
                ),
                Container(
                  height: 70,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(0,2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Image.asset('asset/images/3.png',fit: BoxFit.cover, width: 40,height: 40,),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text('Kursi Gratis', style: headLandBold),
                const SizedBox(
                  height: 3,
                ),
                Text('Ballalalalallaasnadn awgdhawghagdagdhga', style: headLand.copyWith(color: Colors.grey), maxLines: 2,)
              ],
            ),
          ),
        );

      }
    ),
  ),
)



              ],
            ),
          ),
        ),
      ),
    );
  }
}