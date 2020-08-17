import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swadesiplay/utilities/fab_bottom_app_bar.dart';
import 'package:swadesiplay/screens/menu_page.dart';
import 'package:provider/provider.dart';
import 'package:swadesiplay/screens/zoom_scaffold.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  MenuController menuController;

  List<FABBottomAppBarItem> items = [
    FABBottomAppBarItem(iconData: Icons.home, text: 'Home'),
    FABBottomAppBarItem(iconData: Icons.notifications, text: 'Inbox'),
    FABBottomAppBarItem(iconData: Icons.search, text: 'Search'),
    FABBottomAppBarItem(iconData: Icons.person_outline, text: 'Profile'),
  ];

  PageController pageController = PageController();
  int _selectedIndex = 0;

  void _selectedTab(int index) {
    setState(() {
      _selectedIndex = index;
      pageController.animateToPage(index,
          duration: Duration(microseconds: 200), curve: Curves.elasticInOut);
    });
  }

  @override
  void initState() {
    super.initState();

    menuController = new MenuController(
      vsync: this,
    )..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    menuController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => menuController,
      child: ZoomScaffold(
        menuScreen: MenuScreen(),
        contentScreen: Layout(
            contentBuilder: (cc) => PageView(
                  onPageChanged: (page) {
                    setState(() {
                      _selectedIndex = page.toInt();
                    });
                  },
                  controller: pageController,
                  physics: ClampingScrollPhysics(),
                  children: <Widget>[
                    Container(
                      color: Colors.white,
                      child: ListView(
                        children: <Widget>[
                          Container(
                            height: MediaQuery.of(context).size.height * .25,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20))),
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 15, left: 10, right: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      IconButton(
                                        icon: Icon(
                                          Icons.menu,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {
                                          //open drawer menu
                                          Provider.of<MenuController>(cc,
                                                  listen: true)
                                              .toggle();
                                        },
                                      ),
                                      Container(
                                        width: 125.0,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            IconButton(
                                              icon: Icon(
                                                Icons.filter_list,
                                                color: Colors.white,
                                              ),
                                              onPressed: () {
                                                //open drawer menu
                                              },
                                            ),
                                            IconButton(
                                              icon: Icon(
                                                Icons.more_vert,
                                                color: Colors.white,
                                              ),
                                              onPressed: () {
                                                //open drawer menu
                                              },
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 25.0),
                                Padding(
                                  padding: EdgeInsets.only(left: 40),
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        'Hi,',
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25.0),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Bharat',
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: Colors.white,
                                            fontSize: 25.0),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 40.0),
                          Container(
                            height: MediaQuery.of(context).size.height - 185,
                            /*  decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(75),
                                    topRight: Radius.circular(75))),*/
                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Container(
                                height: MediaQuery.of(context).size.height -
                                    300,
                                child: ListView(
                                  children: <Widget>[
                                    Card(
                                      margin: EdgeInsets.only(
                                          top: 20, right: 10),
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(55.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(0),
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              height: 100.0,
                                              width: 100.0,
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
                                                image: DecorationImage(fit: BoxFit.cover,
                                                  image: AssetImage('assets/logos/videos_card_logo.jpg',),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 20,),
                                            Text(
                                              'Start Watching Videos',
                                              style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  color: Colors.black,
                                                  //fontWeight: FontWeight.bold,
                                                  fontSize: 15.0),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Card(
                                      margin: EdgeInsets.only(
                                          left: 50, top: 20, right: 10),
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(50.0),
                                      ),
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            height: 100.0,
                                            width: 100.0,
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
                                                fit: BoxFit.fill,
                                                image: AssetImage('assets/logos/pictures_card_logo.jpg',),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 20,),
                                          Text(
                                            'Picture and Memes',
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                color: Colors.black,
                                                //fontWeight: FontWeight.bold,
                                                fontSize: 15.0),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.blue,
                    ),
                    Container(
                      color: Colors.green,
                    ),
                    Container(
                      color: Colors.yellow,
                    ),
                  ],
                )),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          // mini: true,
          splashColor: Colors.white,
          onPressed: () {},
          tooltip: 'Increment',
          child: Icon(Icons.add),
          elevation: 2.0,
        ),
        bottomNavigationBar: FABBottomAppBar(
          selectedIndex: _selectedIndex,
          selectedColor: Colors.green,
          color: Colors.blueGrey,
          notchedShape: CircularNotchedRectangle(),
          onTabSelected: _selectedTab,
          items: items,
        ),
        appBarTitle: Text(
          items[_selectedIndex].text,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
