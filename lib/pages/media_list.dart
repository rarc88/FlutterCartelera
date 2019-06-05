import 'package:cartelera/common/mediaProvider.dart';
import 'package:cartelera/models/media.dart';
import 'package:cartelera/pages/media_list_item.dart';
import 'package:flutter/material.dart';

class Media_List extends StatefulWidget {
  final MediaProvider provider;
  String category;

  Media_List(this.provider, this.category);

  @override
  State<StatefulWidget> createState() {
    return _Media_List();
  }
}

class _Media_List extends State<Media_List> {
  List<Media> _media = List();

  @override
  void initState() {
    super.initState();
    loadMovies();
  }

  @override
  void didUpdateWidget(Media_List oldWidget) {
    if(oldWidget.provider.runtimeType != widget.provider.runtimeType) {
      _media = List();
      loadMovies();
    }
    super.didUpdateWidget(oldWidget);
  }

  void loadMovies() async {
    var movies = await widget.provider.fetchMedia(widget.category);
    _media.addAll(movies);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _media.length,
      itemBuilder: (BuildContext context, int index) {
        return MediaListItem(_media[index]);
      },
    );
  }
}