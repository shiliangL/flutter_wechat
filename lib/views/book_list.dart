import 'package:flutter/material.dart';

 class BookList extends StatefulWidget {
   _BookListState createState() => _BookListState();
 }
 
 class _BookListState extends State<BookList> {
   @override
   Widget build(BuildContext context) {
     return Container(
        color: Colors.blueAccent,
        child: Text('BookList'),
     );
   }
 }