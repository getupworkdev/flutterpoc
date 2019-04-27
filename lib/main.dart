import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_poc/src/API/ApiService.dart';
import 'package:flutter_poc/src/API/Model/Kids.dart';
import 'package:flutter_poc/src/API/Model/Notification.dart';
import 'package:flutter_poc/src/fab/fab_bottom_app_bar.dart';
import 'package:flutter_poc/src/fab/fab_with_icons.dart';
import 'package:flutter_poc/src/layout.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
     // systemNavigationBarColor: Color.fromRGBO(255,255,255, 1.0),
      statusBarColor: Color.fromRGBO(255,255,255, 1.0), // status bar color
    ));
    return new MaterialApp(
      title: '',

      theme: new ThemeData(
          primaryColor: Color.fromRGBO(255,255,255, 1.0),

      ),
//      theme: new ThemeData(
//        // This is the theme of your application.
//        //
//        // Try running your application with "flutter run". You'll see the
//        // application has a blue toolbar. Then, without quitting the app, try
//        // changing the primarySwatch below to Colors.green and then invoke
//        // "hot reload" (press "r" in the console where you ran "flutter run",
//        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
//        // counter didn't reset back to zero; the application is not restarted.
//        primarySwatch: Colors.green,
//      ),
      home: new MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int _lastSelected = 0;
  List<KidsData> list;
  List<NotificationData> notiList;
  int kidCount = 0;
  int notiCount = 0;


  void _selectedTab(int index) {

    print('_lastSelected ' );
    if(_lastSelected == 0){
      requestNoti();
    }
    setState(() {

      _lastSelected = index;
    });
  }

  void _selectedFab(int index) {
    setState(() {
      _lastSelected = index;
    });
  }

  void requestKids() async {
    var data = await ApiService.getKids();
    setState(() {
      var extractdata = json.decode(data.body);
      var rest = extractdata["data"] as List;
      list = rest.map<KidsData>((json) => KidsData.fromJson(json)).toList();
      kidCount = list.length;
    });
  }


  void requestNoti() async {
    print('requestNoti');
    var data = await ApiService.getNotifications();
    setState(() {
      var extractdata = json.decode(data.body);
      var rest = extractdata["notificationModel"] as List;
      notiList = rest.map<NotificationData>((json) => NotificationData.fromJson(json)).toList();
      notiCount = notiList.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    requestKids();
    requestNoti();
    return Scaffold(
      backgroundColor: Color.fromRGBO(255,255,255, 1.0),
        appBar: AppBar(
          title: Text(widget.title),
          elevation: 0.0,
        ),
        //  drawer: Drawer(),//this will just add the Navigation Drawer Icon

        bottomNavigationBar: FABBottomAppBar(
          backgroundColor: Color.fromRGBO(255,255,255, 1.0),
          centerItemText: '',
          color: Colors.grey,
          selectedColor: Colors.green,
          notchedShape: CircularNotchedRectangle(),
          onTabSelected: _selectedTab,
          items: [
            FABBottomAppBarItem(iconData: Icons.home, text: 'Kids'),
            FABBottomAppBarItem(iconData: Icons.notifications, text: 'Alert'),
            FABBottomAppBarItem(iconData: Icons.directions_bus, text: 'Driver'),
            FABBottomAppBarItem(iconData: Icons.settings, text: 'Settings'),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: _buildFab(context),
        // This trailing comma makes auto-formatting nicer for build methods.
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Batool"),
                accountEmail: Text("batool@calltech.com.sa"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor:
                      Theme.of(context).platform == TargetPlatform.iOS
                          ? Colors.green
                          : Colors.green,
                  child: Text(
                    "B",
                    style: TextStyle(fontSize: 40.0),
                  ),
                ),
              ),
              ListTile(
                title: Text("Settings"),
                trailing: Icon(Icons.settings),
              ),
              ListTile(
                title: Text("Log Out 2"),
                trailing: Icon(Icons.exit_to_app),
              ),
            ],
          ),
        ),
        body: Center(
          child: list != null
            ? listViewWidget(list)
            : Center(child: CircularProgressIndicator()),
        ));
  }

  Widget _buildFab(BuildContext context) {
    final icons = [Icons.sms, Icons.mail, Icons.phone];
    return AnchoredOverlay(
      showOverlay: true,
      overlayBuilder: (context, offset) {
        return CenterAbout(
          position: Offset(offset.dx, offset.dy - icons.length * 35.0),
          child: FabWithIcons(
            icons: icons,
            onIconTapped: _selectedFab,
          ),
        );
      },
      child: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
        elevation: 2.0,
      ),
    );
  }

  Widget listViewWidget(List<KidsData> kisList) {
    if (_lastSelected == 0) {
      return Container(
        child: ListView.builder(
            itemCount: kidCount,
            padding: const EdgeInsets.all(2.0),
            itemBuilder: (context, position) {
              return Card(
                child: Card(
                  elevation: 0.1,
                  margin: new EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 6.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 1.0)),
                    child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        leading: Container(
                          padding: EdgeInsets.only(right: 12.0),
                          decoration: new BoxDecoration(
                              border: new Border(
                                  right: new BorderSide(
                                      width: 1.0, color: Colors.white24))),
                          child: Icon(Icons.child_care, color: Colors.grey),
                        ),
                        title: Text(
                          '${kisList[position].studentName}',
                          style: TextStyle(color: Colors.black,
                              fontWeight: FontWeight.normal),
                        ),
                        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                        subtitle: Row(
                          children: <Widget>[
                            Icon(Icons.school, color: Colors.greenAccent),
                            Text('${kisList[position].schoolName}',
                                style: TextStyle(color: Colors.black))
                          ],
                        ),
                        trailing:
                        Icon(Icons.keyboard_arrow_right, color: Colors.white,
                            size: 30.0))
                    ,
                  ),
                ),
              );
            }),
      );
    }else{
      return Container(
        child: ListView.builder(
            itemCount: notiCount,
            padding: const EdgeInsets.all(2.0),
            itemBuilder: (context, position) {
              return Card(
                child: Card(
                  elevation: 0.1,
                  margin: new EdgeInsets.symmetric(
                      horizontal: 5.0, vertical: 6.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 1.0)),
                    child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        leading: Container(
                          padding: EdgeInsets.only(right: 2.0),
                          decoration: new BoxDecoration(
                              border: new Border(
                                  right: new BorderSide(
                                      width: 1.0, color: Colors.white24))),
                          child: Icon(Icons.notifications, color: Colors.grey),
                        ),
                        title: Text(
                          '${notiList[position].notificationBody}',
                          style: TextStyle(color: Colors.black,
                              fontWeight: FontWeight.normal),
                        ),
                        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                        subtitle: Row(
                          children: <Widget>[
                            //Icon(Icons.school, color: Colors.greenAccent),
                            Text('',
                                style: TextStyle(color: Colors.black))
                          ],
                        ),
//                        trailing:
//                        Icon(Icons.keyboard_arrow_right, color: Colors.white,
//                            size: 30.0)
                    )
                    ,
                  ),
                ),
              );
            }),
      );
    }
  }

}
