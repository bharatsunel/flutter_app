import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swadesiplay/models/MenuItem.dart';
import 'package:swadesiplay/screens/main_page.dart';
import 'package:swadesiplay/utilities/BouncyPageRoute.dart';
import 'package:swadesiplay/screens/sign_up.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Widget _buildSocialBtn(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40.0,
        width: 40.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  Widget _buildSocialBtnRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildSocialBtn(
                () => print('Login with Facebook'),
            AssetImage(
              'assets/logos/facebook.jpg',
            ),
          ),
          _buildSocialBtn(
                () => print('Login with Google'),
            AssetImage(
              'assets/logos/google.jpg',
            ),
          ),
          _buildSocialBtn(
                () => print('Login with Google'),
            AssetImage(
              'assets/logos/twitter.png',
            ),
          ),
        ],
      ),
    );
  }

  _showDialog(BuildContext context) {
    final List<MenuItem> popupRoutes = <MenuItem>[
      MenuItem(title:"Help Centre",iconData:Icons.info),
      MenuItem(title: "Community Guidelines",iconData:Icons.label_important),
      MenuItem(title: "Terms & Conditions",iconData:Icons.local_library),
      MenuItem(title: "Privacy Policy",iconData:Icons.security),
      MenuItem(title: "About Us",iconData:Icons.sentiment_very_satisfied),
    ];

    return showMenu<String>(
      context: context,
      position: new RelativeRect.fromLTRB(100.0, 40.0, 20.0, 100.0),
      items: popupRoutes.map((MenuItem item) {
        return new PopupMenuItem<String>(
          child: ListTile(
            onTap: (){
              //print(item.title);
              Navigator.pop(context, item.title);
            } ,
            leading: Icon(item.iconData, color: Colors.green,),
            title: Text(item.title),
          ),
          value: item.title,
        );
      }).toList(),
      elevation: 8,

    ).then((value) => {

      if(value == 'About Us'){
        showAboutDialog(
            context: context,
            applicationIcon: Icon(Icons.info),
            applicationName: "Swadesi Play",
            applicationVersion: "0.0.1",
            applicationLegalese: 'Developed by Bharat Sunel',
            routeSettings: RouteSettings(),
            children: <Widget>[
              Text('\nA scrolling container that animates items when they are inserted BaseSliderTrackShape: Base track shape that provides an implementation of ... CalendarDatePicker: Displays a grid of days for a given month and allows the user to select a'),
            ]
        )
      }

    });
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: <Widget>[
            GestureDetector(
              onTap : () async {  await _showDialog(context);},
              child: Container(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(Icons.info, color: Colors.green,)),
            ),
          ],
        ),
        resizeToAvoidBottomPadding: true,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: 60,right: 20,left: 20, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top:50),
                          child: Text('Welcome to',
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold)),
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              child: Text('Swadesi Play',
                                  style: TextStyle(
                                      fontSize: 50.0, fontWeight: FontWeight.bold)),
                            ),
                            Container(
                              child: Text('.',
                                  style: TextStyle(
                                      fontSize: 50.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green)),
                            ),
                          ],
                        )
                      ],

                    ),
                    Container(
                        padding:
                        EdgeInsets.only(top: 60.0),
                        child: Column(
                          children: <Widget>[
                            TextField(
                              decoration: InputDecoration(
                                  labelText: 'EMAIL',
                                  labelStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.green))),
                            ),
                            SizedBox(height: 10.0),
                            TextField(
                              decoration: InputDecoration(
                                  labelText: 'PASSWORD',
                                  labelStyle: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: Colors.green))),
                              obscureText: true,
                            ),
                            SizedBox(height: 5.0),
                            Container(
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.only(top: 15.0),
                              child: InkWell(
                                child: Text(
                                  'Forgot Password',
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat',
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                            ),
                            SizedBox(height: 40.0),
                            Text('By signing in you agree to our Terms & Condition and Privacy Policy'),
                            SizedBox(height: 10.0),
                            Container(
                              height: 50.0,
                              child: Material(
                                borderRadius: BorderRadius.circular(20.0),
                                shadowColor: Colors.greenAccent,
                                color: Colors.green,
                                elevation: 7.0,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Center(
                                    child: Text(
                                      'LOGIN',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Montserrat'),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 15.0),
                            Container(
                              height: 50.0,
                              color: Colors.transparent,
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black,
                                        style: BorderStyle.solid,
                                        width: 1.0),
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(context, BouncyPageRoute(widget: new MainPage()));
                                  },
                                  child: Center(
                                    child: Text('Skip',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Montserrat')),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20.0),
                            _buildSocialBtnRow(),
                          ],
                        )),
                    SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'New to Swadesi Play ?',
                          style: TextStyle(fontFamily: 'Montserrat'),
                        ),
                        SizedBox(width: 5.0),
                        InkWell(
                          onTap: () {
                            //Navigator.of(context).pushNamed('/signup');
                            Navigator.push(context, BouncyPageRoute(widget: new SignupPage()));
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(
                                color: Colors.green,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}