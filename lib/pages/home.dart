import 'package:cartelera/pages/media_list.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final String title;
  Home({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
  
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Colors.white,),
            onPressed: () {

            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Material(),
            ),
            ListTile(
              title: Text('Peliculas'),
              trailing: Icon(Icons.local_movies),
            ),
            Divider(
              height: 5.0,
            ),
            ListTile(
              title: Text('Television'),
              trailing: Icon(Icons.live_tv),
              onTap: () => Navigator.of(context).pop(),
            ),
            Divider(
              height: 5.0,
            ),
            ListTile(
              title: Text('Cerrar'),
              trailing: Icon(Icons.close),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      body: PageView(
        children: <Widget>[
          Media_List()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _getFooterItems(),
      ),
    );
  }

  List<BottomNavigationBarItem> _getFooterItems() {
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.thumb_up),
        title: Text('Populares'),
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.update),
        title: Text('Proximamente')
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.star),
        title: Text('Mejor valoradas')
      ),
    ];
  }
  
}