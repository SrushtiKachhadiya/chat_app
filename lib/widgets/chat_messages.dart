import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('chat').snapshots(),
        builder: (context, chatSnapshot) {
          if(chatSnapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          if(!chatSnapshot.hasData || chatSnapshot.data!.docs.isEmpty){
            return Center(
              child: Text('No messages found.'),
            );
          }
          if(chatSnapshot.hasError){
            return Center(
              child: Text('Something went wrong.'),
            );
          }
          final loadedData = chatSnapshot.data!.docs;
          return ListView.builder(
            itemCount: loadedData.length,
              itemBuilder: (context, index) {
              return Text(loadedData[index].data()['text']);
              });
        });

  }
}
