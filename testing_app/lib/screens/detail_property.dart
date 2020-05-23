import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DetailPropertyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    getTopImageCard(img) {
      return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        margin: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 5),
        elevation: 2.0,
        child: Column(
          children: <Widget>[
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(
                    img,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    ingredientCard(ingri, ingriDetail, qty) {
      return Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  ingri,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(qty),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Icon(Icons.check_circle, color: theme.primaryColor),
                SizedBox(width: 10),
                Text(ingriDetail)
              ],
            ),
            SizedBox(height: 10),
            Divider()
          ],
        ),
      );
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white.withOpacity(0.9),
        elevation: 0,
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.star,
                  size: 26.0,
                  color: theme.primaryColor,
                ),
              )),
        ],
        iconTheme: IconThemeData(color: theme.primaryColor),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            color: Colors.white,
            width: double.infinity,
            child: Column(
              children: <Widget>[
                getTopImageCard('https://picsum.photos/500'),
                Container(
//              color: Colors.grey,
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          'Str Fry Zucchini Noodles',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          'By Alex Jones',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: theme.primaryColor),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: Wrap(
                          spacing: 10,
                          children: <Widget>[
                            Chip(
                              label: Text(
                                'Noodles',
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Theme.of(context).primaryColor,
                              elevation: 1,
                            ),
                            Chip(
                              label: Text(
                                'Italian',
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Theme.of(context).primaryColor,
                              elevation: 1,
                            ),
                            Chip(
                              label: Text(
                                'Main Dish',
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Theme.of(context).primaryColor,
                              elevation: 1,
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.watch_later),
                                  Text('20 min'),
                                ],
                              ),
                            ),
                            SizedBox(height: 40, child: VerticalDivider()),
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.favorite),
                                  Text('130 cal'),
                                ],
                              ),
                            ),
                            SizedBox(height: 40, child: VerticalDivider()),
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.shopping_cart),
                                  Text('3/6'),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Divider(
                  thickness: 10,
                  color: Color.fromRGBO(243, 243, 243, 1.0),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Ingredients for 2 servings',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      Divider(),
                      ingredientCard('Mozzarella Cheese',
                          'Micheli\'s Cheese Parmesan Grated', '1 Pound'),
                      ingredientCard(
                          'Tomato Paste', 'American Tomato Paste', '2 Cans'),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
