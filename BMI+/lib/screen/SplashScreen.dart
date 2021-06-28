

import 'package:bmi_calculator/ad_manager.dart';
import 'package:bmi_calculator/screen/input_page.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const String id = '/SplashScreen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{
  Future<void> _initAdMob() {
    // TODO: Initialize AdMob SDK
    return FirebaseAdMob.instance.initialize(appId: AdManager.appId);
  }
  BannerAd _bannerAd;
  void _loadBannerAd() {
    _bannerAd
      ..load()
      ..show(anchorType: AnchorType.top);
  }
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Route route = MaterialPageRoute(builder: (context) => InputPage());
      Navigator.pushReplacement(context, route);
    });
    _bannerAd = BannerAd(
        adUnitId: AdManager.bannerAdUnitId,
        size: AdSize.smartBanner,);
    _loadBannerAd();

  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E21),
      body:  Center(
        child: Container(
          height:MediaQuery.of(context).size.height * 0.4,
          width: MediaQuery.of(context).size.width * 0.6,

          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("assets/bmii.png"),
              fit: BoxFit.fill,
            ),


          ),


        ),
      ),
    );
  }


}
