import 'package:flutter/material.dart';
import 'package:latihan_flutter/pages/login.dart';
import 'package:latihan_flutter/theme.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          actions: [
            TextButton(onPressed: (){}, child: Text('Sign In', style: headLandBold,))
          ],
          leading: IconButton(
          icon: Icon(Icons.arrow_circle_left_outlined), 
          color: biruHitam,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      
      body: Container(
        height: height,
        padding: const EdgeInsets.only(left: 8, right: 8,top: 90),
        child: Column(
          children: [
            SizedBox(
              width: width,
              child: Center(
                child: Text('Create your\n   account',style: headLandBold.copyWith(fontSize: 30),),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            SizedBox(
              width: 300,
              child: TextFormField( 
                obscureText: false,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
                  hintText: 'Username',
                  hintStyle: headLand.copyWith(color: Colors.white),
                  filled: true,
                  fillColor: biruHitam,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    borderSide: BorderSide.none
                  ),
                  isDense: true,
                  isCollapsed: true
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 300,
              child: TextFormField( 
                obscureText: false,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
                  hintText: 'Masukkan email anda',
                  hintStyle: headLand.copyWith(color: Colors.white),
                  filled: true,
                  fillColor: biruHitam,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    borderSide: BorderSide.none
                  ),
                  isDense: true,
                  isCollapsed: true
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 300,
              child: TextFormField( 
                obscureText: true,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
                  hintText: 'Masukkan password',
                  hintStyle: headLand.copyWith(color: Colors.white),
                  filled: true,
                  fillColor: biruHitam,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    borderSide: BorderSide.none
                  ),
                  isDense: true,
                  isCollapsed: true
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: 300,
              height: 50,
              child: FilledButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(biruLangit)
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                            return const LoginPage();
                          }));
                }, 
                child: Text('Sign Up', style: headLandBold.copyWith(color: Colors.white),)
              ),
            ),

          ],
        ),
      ),
    );
  }
}