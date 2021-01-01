import 'package:dro_health/data.dart';
import 'package:dro_health/ext/auth/login/login.dart';
import 'package:dro_health/ext/auth/register/signup1/steps/acknowledge.dart';
import 'package:dro_health/ext/auth/register/signup_partner/acknowledge_partner.dart';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Welcome extends StatefulWidget {
  static const routename = '/welcome';
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final sliders = SplashSlider;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(12, 184, 182, 1),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Container(
                height: 460,
                width: double.infinity,
                padding: EdgeInsets.all(30),
                child: Swiper(
                  autoplay: true,
                  autoplayDelay: 4000,
                  pagination: SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                        color: Colors.white70,
                        activeColor: Colors.white,
                        size: 5),
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.all(30),
                      //height: 350,
                      //width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            //height: 200,
                            //width: 200,
                            child: Image.asset(
                              sliders[index].images,
                              // fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            sliders[index].title,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            sliders[index].description,
                            textAlign: TextAlign.center,
                            softWrap: true,
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: sliders.length,
                  viewportFraction: 0.9,
                  scale: 0.9,
                ),
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  height: 200,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Login(),
                            ),
                          );
                        },
                        child: Container(
                          height: 45,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white, width: 1.2),
                          ),
                          child: Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 18,
                                //fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Acknowledge(),
                            ),
                          );
                        },
                        child: Container(
                          height: 45,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.white,
                              width: 1.2,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                  fontSize: 18,
                                  //fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.white,
                        thickness: 1,
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AcknowledgePartner(),
                            ),
                          );
                        },
                        child: Container(
                          height: 45,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.white, width: 1.2),
                          ),
                          child: Center(
                            child: Text(
                              'Sign up with a partner',
                              style: TextStyle(
                                  fontSize: 18,
                                  //fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
