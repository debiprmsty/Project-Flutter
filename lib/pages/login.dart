import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:latihan_flutter/pages/home.dart';
import 'package:latihan_flutter/pages/index.dart';
import 'package:latihan_flutter/pages/register.dart';
import 'package:latihan_flutter/theme.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;


    return Scaffold(
      body: Container(
        height: height,
        padding: const EdgeInsets.only(left: 8, right: 8,top: 50),
        child: Column(
          children: [
            SizedBox(
              width: width,
              child: Center(
                child: Text('Log in',style: headLandBold.copyWith(fontSize: 30),),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            SizedBox(
              width: width,
              child: Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 150,
                      height: 150,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(75)),
                        color: biruHitam
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      width: 135,
                      height: 135,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(75)),
                        image: DecorationImage(
                          image: AssetImage('asset/images/4.jpg', package: null),
                          fit: BoxFit.cover
                        )
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height:80),
            SizedBox(
              width: 300,
              child: TextFormField( 
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
                  hintText: 'Masukkan email',
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
              height: 30,
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
                            return const MainPage();
                          }));
                }, 
                child: Text('Log in', style: headLandBold.copyWith(color: Colors.white),)
              ),
            ),
            SizedBox(
              height: 8,
            ),
            SizedBox(
              width: 300,
              child: Center(
                child: Text.rich(
                  TextSpan(
                    text: 'Belum punya akun ? ',
                    style: headLand.copyWith(color: biruLangit),
                    children: [
                      TextSpan(
                        text: 'Register',
                        style: headLand.copyWith(fontWeight: FontWeight.bold,color: biruLangit),
                        recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return const RegisterPage();
                          }));
                        },
                      )
                    ]
                  )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}