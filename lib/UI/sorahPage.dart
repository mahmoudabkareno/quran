import 'package:flutter/material.dart';
import 'package:quran/Models/Sorah.dart';
import 'package:quran/UI/ElfatihaUI.dart';
import 'package:quran/UI/HomePage.dart';
import 'package:quran/FechAPIs/fetchAPIData.dart';
import 'package:quran/UI/comentpage.dart';

class SorahPage extends StatefulWidget {
  @override
  _SorahPageState createState() => _SorahPageState();
}

class _SorahPageState extends State<SorahPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return HomePage();
              }));
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        title: Text(
          'Ayat El Quran',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              fontStyle: FontStyle.italic,
              color: Colors.black),
        ),
        backgroundColor: Colors.white,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return comentpage();
              }));
            },
            child: Icon(
              Icons.group,
              color: Colors.black,
            ),
          )
        ],
      ),
      backgroundColor: Colors.grey,
      body: FutureBuilder(
        future: fetchAPIData.getApi(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
            );
          }
          List<Sorah> data = snapshot.data;
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
                  if(index == 0){
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return ElfatihaUI();
                    }));
                  }
                },
                child: Card(
                    color: Colors.grey,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.black,
                        child: Text(
                          data[index].number.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                              color: Colors.white),
                        ),
                      ),
                      title: Text(
                        data[index].englishName.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                            color: Colors.white),
                      ),
                      subtitle: Text(
                        data[index].name.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                            color: Colors.white),
                      ),
                    )),
              );
            },
          );
        },
      ),
    );
  }
}
