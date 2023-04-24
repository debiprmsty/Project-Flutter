import 'package:flutter/material.dart';
import 'package:latihan_flutter/pages/aboutPage.dart';
import 'package:latihan_flutter/pages/login.dart';
import 'package:latihan_flutter/pages/profile.dart';
import 'package:latihan_flutter/theme.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  bool isWishList1 = false;
  bool isWishList2 = false;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void onTabTapped(index) {
    setState(() {
      currentIndex = index;
    });
  }

  
  
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;


    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          scaffoldKey.currentState?.openDrawer();
        }, icon: const Icon(Icons.menu, color: Colors.black,)),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: CircleAvatar(
              backgroundImage: AssetImage('asset/images/5.jpg', package: null),
            ),
          )
        ],
      ),
      drawer: DrawerWidget(

      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.only(bottom: 20),
          width: width,
          child: Column(
            children: [
              // judul
              Container(
                width: width,
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 13),
                child: Text('Best Furniture\nin your home', style: headLandBold.copyWith(fontSize: 23),),
              ),
      
              // search & filter
              Container(
                width: width,
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 13),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
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
                      )
                    ),
                    const SizedBox(
                      width: 17,
                    ),
                    FilledButton(
                      style: ButtonStyle(
                        shape: MaterialStatePropertyAll(
                          ContinuousRectangleBorder(borderRadius: BorderRadius.circular(20))                        
                        ),
                        padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 12, horizontal: 9)),
                        backgroundColor: MaterialStatePropertyAll(Colors.grey[200])
                      ),
                      child: const Icon(Icons.sort_rounded, color: Colors.grey,),
                      onPressed: () {},
                      )
                  ],
                ),
              ),
              
              // judul rekomendasi
              const SizedBox(
                height: 15,
              ),
              Container(
                width: width,
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 13),
                child: const Text('Rekomendasi', style: headLandBold,),
              ),
              const SizedBox(
                height: 6,
              ),
              
              // Produk Rekomendasi
              Container(
                width: width,
                height: 80,
                margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 13),
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
                child: ListTile(
                  leading: Container(
                    padding: const EdgeInsets.only(top: 5),
                    width: 80,
                    height: 160,
                    child: Image.asset('asset/images/1.png', fit: BoxFit.cover),
                  ),
                  title: Container(
                    margin: const EdgeInsets.only(top: 6),
                    child: Text('Kursi Abu monitor', style: headLandBold.copyWith(fontSize: 12),)
                  ),
                  subtitle: Container(
                    margin: const EdgeInsets.only(top: 5),
                    child: Row(
                      children: [
                        Image.asset('asset/images/6.jpg', width: 20, height: 20,),
                        const SizedBox(
                          width: 5,
                        ),
                        Text('4.5/5',style: headLandBold.copyWith(fontSize: 10),)
                      ],
                    ),
                  ),
                  trailing: Container(
                    margin: const EdgeInsets.only(top: 15),
                    width: 30,
                    child: FilledButton(
                      style: ButtonStyle(
                        padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 8,horizontal: 2)),
                        backgroundColor: const MaterialStatePropertyAll(biruHitam),
                        shape: MaterialStatePropertyAll(
                          ContinuousRectangleBorder(borderRadius: BorderRadius.circular(20))
                        )
                      ),
                      onPressed: () {}, 
                      child: const Icon(Icons.arrow_forward, color: Colors.white,)
                      ),
                  ),
                  onTap: () {
                    // do something when the item is tapped
                  },
                ),
              ),
      
              // Judul Kategori
              const SizedBox(
                height: 10,
              ),
              Container(
                width: width,
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 13),
                child: const Text('Categories', style: headLandBold,),
              ),
              const SizedBox(
                height: 10,
              ),
      
              // Kategori Button
              Container(
                width: width,
                margin: const EdgeInsets.only(left: 13 ,right: 13),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FilledButton.icon(
                        style: ButtonStyle(
                          padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 21, horizontal: 9)),
                          shape: MaterialStatePropertyAll(
                            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(20))                        
                          ),
                          backgroundColor: const MaterialStatePropertyAll(biruHitam)
                        ),
                        onPressed: (){}, 
                        icon: const Icon(Icons.chair, color: Colors.white,), 
                        label: Text('Chair', style: headLandBold.copyWith(color: Colors.white),)
                      ),
                      const SizedBox(width: 8,),
                      FilledButton(
                        style: ButtonStyle(
                          padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 21, horizontal: 9)),
                          shape: MaterialStatePropertyAll(
                            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(20))                        
                          ),
                          backgroundColor: MaterialStatePropertyAll(Colors.grey[200])
                        ),
                        onPressed: () {}, child: const Text('Table', style: headLandBold,)
                      ),
                      const SizedBox(width: 8,),
                      FilledButton(
                        style: ButtonStyle(
                          padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 21, horizontal: 9)),
                          shape: MaterialStatePropertyAll(
                            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(20))                        
                          ),
                          backgroundColor: MaterialStatePropertyAll(Colors.grey[200])
                        ),
                        onPressed: () {}, child: const Text('Cupboard', style: headLandBold,)
                      ),
                      const SizedBox(width: 8,),
                      FilledButton(
                        style: ButtonStyle(
                          padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 21, horizontal: 9)),
                          shape: MaterialStatePropertyAll(
                            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(20))                        
                          ),
                          backgroundColor: MaterialStatePropertyAll(Colors.grey[200])
                        ),
                        onPressed: () {}, child: const Text('Sofa', style: headLandBold,)
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
      
              // Judul Produk Populer
              Container(
                width: width,
                padding: const EdgeInsets.symmetric(horizontal: 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Top Chair', style: headLandBold,),
                    TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('View All', style: headLandBold.copyWith(color: Colors.grey),),
                          const SizedBox(
                            width: 5,
                          ),
                          const Icon(Icons.add_box, color: Colors.grey,),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
      
              // Produk Populer
              Container(
                width: width,
                
                margin: const EdgeInsets.symmetric(horizontal: 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
                        height: 270,
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
                                setState(() {
                                  isWishList1 = !isWishList1;
                                });
                              }, icon: Icon(Icons.favorite, size: 20,color: isWishList1 ? Colors.red : Colors.grey,)),
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
                              child: Image.asset('asset/images/2.jpg',fit: BoxFit.cover, width: 40,height: 60,),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text('Kursi Gratis', style: headLandBold),
                            const SizedBox(
                              height: 3,
                            ),
                            Text('Ballalalalallaasnadn', style: headLand.copyWith(color: Colors.grey),maxLines: 2,)
                          ],
                        ),
                      )
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
                        height: 270,
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
                                setState(() {
                                  isWishList1 = !isWishList1;
                                });
                              }, icon: Icon(Icons.favorite, size: 20,color: isWishList1 ? Colors.red : Colors.grey,)),
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
                      )
                    ),
                  ],
                ),
              )
      
            ],
          ),
        ),
      ),
    );
  }
}




class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: biruLangit
              ),
              alignment: Alignment.center,
              height: 100,
              child: Text('MB Shop', style: headLandBold.copyWith(color: Colors.white, fontSize: 26),),
            )
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: Text('Profile', style: headLandBold.copyWith(color: Colors.grey),),
            onTap: () {
               Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return const ProfilePage();
                }));
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: Text('About', style: headLandBold.copyWith(color: Colors.grey),),
            onTap: () {
               Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return const AboutPage();
                }));
            },
          ),
          ListTile(
            leading: Icon(Icons.output),
            title: Text('Logout', style: headLandBold.copyWith(color: Colors.grey),),
            onTap: () {
              // TODO: Implement profile page.
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
               
            
            },
          ),
        ],
      ),
    );
  }
}
