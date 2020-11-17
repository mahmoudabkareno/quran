import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran/FechAPIs/GetEmployee .dart';
import 'package:quran/Models/Employye.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_screen";
  static const String title = "Home";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(HomePage.title),
        ),
        body: Center(
            child: _employeesData()
        )
    );
  }
  FutureBuilder _employeesData(){
    return FutureBuilder<List<Employees>>(
      future: GetEmployee().getEmployees(),
      builder: (BuildContext context, AsyncSnapshot<List<Employees>> snapshot){
        if (snapshot.hasData) {
          List<Employees> data = snapshot.data;
          return _employees(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }
  ListView _employees(data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Card(
              child: _tile(data[index].employeeName, data[index].employeeSalary, Icons.work)
          );
        }
    );
  }

  ListTile _tile(String title, String subtitle, IconData icon) {
    return ListTile(
      title: Text(title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          )),
      subtitle: Text(subtitle),
      leading: Icon(
        icon,
        color: Colors.blue[500],
      ),
    );
  }
}
