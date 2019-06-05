import 'package:cartelera/common/mediaProvider.dart';
import 'package:cartelera/pages/media_list.dart';
import 'package:cartelera/pages/media_list_item.dart';
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
  final MediaProvider movieProvider = MovieProvider();
  final MediaProvider showProvider = ShowProvider();
  MediaType mediaType = MediaType.movie;

  PageController _pageController;
  int _page = 0;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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
              selected: this.mediaType == MediaType.movie,
              trailing: Icon(Icons.local_movies),
              onTap: () {
                _changeMediaType(MediaType.movie);
                Navigator.of(context).pop();
              },
            ),
            Divider(
              height: 5.0,
            ),
            ListTile(
              title: Text('Television'),
              selected: this.mediaType == MediaType.show,
              trailing: Icon(Icons.live_tv),
              onTap: () {
                _changeMediaType(MediaType.show);
                Navigator.of(context).pop();
              },
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
        children: _getMediaList(mediaType),
        controller: _pageController,
        onPageChanged: (int index) {
          _page = index;
          setState(() {});
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _getFooterItems(),
        onTap: _navigationTapped,
        currentIndex: _page,
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
        title: Text(mediaType == MediaType.movie ? 'Proximamente': 'En el aire')
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.star),
        title: Text('Mejor valoradas')
      ),
    ];
  }

  void _changeMediaType(MediaType mediaType) {
    if(this.mediaType != mediaType) {
      this.mediaType = mediaType;
      setState(() {});
    }
  }

  List<Widget> _getMediaList(MediaType mediaType) {
    return this.mediaType == MediaType.movie ? <Widget>[
      Media_List(this.movieProvider, 'popular'),
      Media_List(this.movieProvider, 'upcoming'),
      Media_List(this.movieProvider, 'top_rated')
    ]
    : <Widget>[
        Media_List(this.showProvider, 'popular'),
        Media_List(this.showProvider, 'on_the_air'),
        Media_List(this.showProvider, 'top_rated'),
    ];
  }

  void _navigationTapped(int page) {
    this._pageController.animateToPage(page, duration: Duration(milliseconds: 300), curve: Curves.ease);
  }
  
}