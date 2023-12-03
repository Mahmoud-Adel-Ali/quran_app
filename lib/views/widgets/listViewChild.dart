// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quran_app/views/readerContent.dart';

class ListViewChild extends StatelessWidget {
  const ListViewChild({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ReaderContent(),));
      },
      child: Container(
        height: 60,
        margin: EdgeInsets.only(bottom: 5),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: ListTile(
          // trailing: Icon(Icons.check,color: Colors.black,),
          trailing: CircleAvatar(
            // backgroundColor: textColor,
            backgroundImage: AssetImage('assets/img/islam.jpeg',),
          ),
          titleAlignment:ListTileTitleAlignment.center,
          title: Text(
            "islam sobhi   اسلام صبحي",
            style: TextStyle(color: Colors.black, fontSize: 22),
          ),
        ),
      ),
    );
  }
}
