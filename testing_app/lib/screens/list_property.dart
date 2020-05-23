import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testingapp/screens/detail_property.dart';
import 'package:testingapp/widgets/corner_button.dart';
import 'package:testingapp/widgets/filter_form.dart';

class ListPropertyScreen extends StatefulWidget {
  //https://picsum.photos/500
  @override
  _ListPropertyScreenState createState() => _ListPropertyScreenState();
}

class _ListPropertyScreenState extends State<ListPropertyScreen> {
  Widget foodCard({context, String img, int time, int cal}) {
    var lightColor = Color.fromRGBO(180, 180, 180, 1.0);
    return Column(
//      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.width * 0.55,
            decoration: BoxDecoration(color: Color(0xFF06B79D)),
            child: Row(
              children: <Widget>[
                Flexible(
                  fit: FlexFit.tight,
                  flex: 3,
                  child: ClipPath(
                    clipper: FoodClipper(),
                    child: Image.network(
                      img,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Flexible(
                    child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.watch_later, color: Colors.white),
                      Text('$time min', style: TextStyle(color: Colors.white)),
                      Divider(color: Colors.white),
                      Icon(Icons.favorite, color: Colors.white),
                      Text('$cal cal', style: TextStyle(color: Colors.white)),
                      Divider(color: Colors.white),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.all(8),
                        child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.shopping_cart,
                              color: Theme.of(context).primaryColor,
                              size: 20,
                            ),
                            Text(
                              '3/6',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ) //.padding(),
                    )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 15),
          child: SizedBox(
            width: double.infinity,
            child: Text(
              'Str Fry Zucchini Noodles',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Wrap(
                  spacing: 10,
                  children: <Widget>[
                    FilterChip(
                      label: Text(
                        'Noodles',
                        style: TextStyle(color: lightColor),
                      ),
                      shape: StadiumBorder(side: BorderSide(color: lightColor)),
                      backgroundColor: Colors.transparent,
                      onSelected: (bool value) {},
                    ),
                    FilterChip(
                      label: Text(
                        'Italian',
                        style: TextStyle(color: lightColor),
                      ),
                      shape: StadiumBorder(side: BorderSide(color: lightColor)),
                      backgroundColor: Colors.transparent,
                      onSelected: (bool value) {},
                    ),
                    FilterChip(
                      label: Text(
                        'Main Dish',
                        style: TextStyle(color: lightColor),
                      ),
                      shape: StadiumBorder(side: BorderSide(color: lightColor)),
                      backgroundColor: Colors.transparent,
                      onSelected: (bool value) {},
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Icon(
                  Icons.delete,
                  color: Colors.redAccent,
                ),
              )
            ],
          ),
        ),
        Divider(
          indent: 15,
          endIndent: 15,
          color: Colors.grey,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        brightness: Brightness.light,
        title: Text(
          'Realmzoe',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
//        leading: Icon(Icons.menu, color: Colors.black),
        backgroundColor: Colors.white.withOpacity(0.9),
//        backgroundColor: Color(0xFFFFFF).withOpacity(1),
        elevation: 0,
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.shopping_cart,
                  size: 26.0,
                  color: Colors.black,
                ),
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            color: Colors.white,
            width: double.infinity,
            child: Column(
              children: <Widget>[
//                SizedBox(
//                  height: AppBar().preferredSize.height,
//                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      'Cooklist',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        'Discover something delicious',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: CornerButton(
                        txt: 'Filter',
                        onpressed: () {
                          _setBottomSheet(context);
                        },
                        leftIcon: Icon(Icons.filter_list),
                        color: Colors.white,
                        txtColor: theme.primaryColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
//                Navigator.push(
//                    context,
//                    MaterialPageRoute(
//                        builder: (ctx) => DetailPropertyScreen()));
                    Get.to(DetailPropertyScreen());
                  },
                  child: foodCard(
                    context: context,
                    img: 'https://picsum.photos/500',
                    time: 25,
                    cal: 10,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                foodCard(
                  context: context,
                  img: 'https://picsum.photos/600',
                  time: 25,
                  cal: 10,
                ),
//            TabBar(
//              tabs: <Widget>[],
//            )
              ],
            ),
          ),
        ),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
//          padding: EdgeInsets.zero,
          children: <Widget>[
//            DrawerHeader(
//              child: Text(
//                'Drawer Header',
//                style: TextStyle(color: Colors.white),
//              ),
//              decoration: BoxDecoration(
//                color: theme.primaryColor,
//              ),
//            ),
            ListTile(
              leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://randomuser.me/api/portraits/men/75.jpg")),
              title: Text('John Smith'),
              subtitle: Text("johnsmith@code.com"),
            ),
            Divider(),
            ListTile(
              title: Text('Home'),
              leading: Icon(Icons.home),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('My Favorite'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Setting'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              leading: Icon(Icons.forum),
              title: Text('Contact Us'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
    );
  }

  void _setBottomSheet(ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (BuildContext bc) {
          return FilterForm();
        });
  }
}

class FoodClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width * 0.9, size.height);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width * 0.9, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
