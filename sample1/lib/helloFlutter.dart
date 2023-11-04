import 'package:flutter/material.dart';
import 'package:sample/personViewModel.dart';

class HelloFlutter extends StatelessWidget {
  final String title;
  final PersonViewModel personViewModel = PersonViewModel([]);

  HelloFlutter({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    String? label = '';

    switch(Theme.of(context).platform) {
      case TargetPlatform.windows:
        label = MaterialLocalizations.of(context).drawerLabel;
      default: label = "empty";
    }

    return MaterialApp(
      debugShowCheckedModeBanner: true,

      home: Scaffold(
        backgroundColor: Colors.cyan,
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: Text(title),
        ),
        body: Container (
          height: 200,
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          margin: const EdgeInsets.all(30),
          padding: const EdgeInsets.all(30),
          //color: Colors.deepPurpleAccent,
          transform: Matrix4.rotationZ(0.1),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 3),
          ),
          child: const Center(
            child: Text("Hello, Jina's", style: TextStyle(fontSize: 20, color: Colors.white),),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 10.0,
          child: const Icon(Icons.add),
          onPressed: () 
          {
            this.personViewModel.add(new Person(name: 'test', age: 20));
          },
          
        ),
        drawer: Drawer(
          child: ListView(
            children: const <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                ),
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.lightBlueAccent),
                  accountName: Text(
                    "Sample App",
                    style: TextStyle(fontSize: 18),
                  ),
                  accountEmail: Text("h20913@gmail.com"),
                  currentAccountPictureSize: Size.square(50),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 165, 255, 137),
                    child: Text(
                      "Admin",
                      style: TextStyle(fontSize: 30.0, color: Colors.blue),
                    ), //Text
                  ), //circleAvatar
                ), //UserAccountDrawerHeader
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text(' My Profile '),
              ),
              ListTile(
                leading: Icon(Icons.book),
                title: Text(' My Course '),
              ),
              ListTile(
                leading: Icon(Icons.workspace_premium),
                title: Text(' Go Premium '),
              ),
              ListTile(
                leading: Icon(Icons.video_label),
                title: Text(' Saved Videos '),
              ),
              ListTile(
                leading: Icon(Icons.edit),
                title: Text(' Edit Profile '),
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('LogOut'),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: 0,
            fixedColor: Colors.green,
            items: const [
              BottomNavigationBarItem(
                label: "Home",
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: "Search",
                icon: Icon(Icons.search),
              ),
              BottomNavigationBarItem(
                label: "Profile",
                icon: Icon(Icons.account_circle),
              ),
            ],
            onTap: (int indexOfItem) {

            }),
      ),
    );
  }
}
