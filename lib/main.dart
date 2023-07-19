import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: AnimatedSearchBar(),
        ),
      ),
    );
  }
}

class AnimatedSearchBar extends StatefulWidget {
  @override
  _AnimatedSearchBarState createState() => _AnimatedSearchBarState();
}

class _AnimatedSearchBarState extends State<AnimatedSearchBar> {
  bool _isSearchActive = false;
  final _focusNode = FocusNode();

  void _toggleSearch() {
    setState(() {
      _isSearchActive = !_isSearchActive;
    });
    if (!_isSearchActive) {
      _focusNode.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleSearch,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: _isSearchActive ? 200 : 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade800,
              offset: Offset(1.5, 1.5),
              blurRadius: 3.0,
            ),
            BoxShadow(
              color: Colors.grey.shade600,
              offset: Offset(-1.5, -1.5),
              blurRadius: 3.0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: _isSearchActive ? 10 : 0),
              child: Icon(Icons.search, color: Colors.white),
            ),
            _isSearchActive ? Expanded(child: Padding(
              padding: EdgeInsets.only(right: 10),
              child: TextField(
                autofocus: true,
                focusNode: _focusNode,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Type to search...",
                  hintStyle: TextStyle(color: Colors.white70),
                ),
              ),
            )) : Container(),
          ],
        ),
      ),
    );
  }
}
