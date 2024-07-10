import 'package:flutter/material.dart';


class HeartIcon extends StatefulWidget {
  @override
  _HeartIconState createState() => _HeartIconState();
}

class _HeartIconState extends State<HeartIcon> {
  bool _isFavorited = false;

  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
    });
    // if (_isFavorited) {
    //
    // }
  }



  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        _isFavorited ? Icons.favorite : Icons.favorite_border,
        color: _isFavorited ? const Color.fromARGB(255, 169, 22, 11) : Colors.black,
      ),
      onPressed: _toggleFavorite,
      iconSize: 30.0,
    );
  }
}
