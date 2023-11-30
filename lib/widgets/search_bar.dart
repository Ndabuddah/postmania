import 'package:flutter/material.dart';

class Search_Bar extends StatelessWidget {
  const Search_Bar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.all(8.0),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color:  const Color(0xFFC017FF).withOpacity(0.4),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: TextFormField(
            cursorColor: Colors.black,
            decoration:  InputDecoration(
              hintText: 'Search...',
              hintStyle: TextStyle(color: Colors.black.withOpacity(0.8)),
              prefixIcon:  Padding(
                padding: const EdgeInsets.only(left: 16, top: 6),
                child: Icon(Icons.search, color: Colors.black.withOpacity(0.7),
                ),

              ),
              suffixIcon: Icon(Icons.mic,color: Colors.black.withOpacity(0.7)),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
//To-Do . Implement search filter logic , add speech to text for search 