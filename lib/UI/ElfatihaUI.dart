import 'package:flutter/material.dart';
import 'package:quran/FechAPIs/fetchAPIData.dart';
import 'package:quran/Models/Elfatiha.dart';
import 'package:quran/UI/sorahPage.dart';

class ElfatihaUI extends StatefulWidget {
  @override
  _ElfatihaUIState createState() => _ElfatihaUIState();
}

class _ElfatihaUIState extends State<ElfatihaUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SorahPage();
              }));
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        title: Text(
          fatihaname.toString(),
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              fontStyle: FontStyle.italic,
              color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.grey,
      body: FutureBuilder(
        future: fetchAPIData.getApiElfatiha(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
            );
          }
          List<ElFatiha> data = snapshot.data;
          return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Container(
                child: Row(
                    children: [
                     Expanded(
                       child:  Text(
                         '${data[index].text.toString()} ${data[index].number.toString()}',
                         style: TextStyle(
                             fontSize: 20,
                             color: Colors.white
                         ),
                       ),
                     )
                    ],
                  ),
              );
            },
          );
        },
      ),
    );
  }

}
