import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewMessage extends StatefulWidget{
  const NewMessage({super.key});

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  @override
  Widget build(BuildContext context) {
   return Padding(padding: EdgeInsets.only(left: 15,right: 1,bottom: 14),
   child: Row(
     children: [
       Expanded(child: TextField()),
       Expanded(child: IconButton(onPressed: (){}, icon: Icon(Icons.send)))
     ],
   ),);
  }
}