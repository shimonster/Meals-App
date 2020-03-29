import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const screenRoute = '/MealDetailsScreen';

  Widget buildSectionTitle(String text, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildItemWraper(Widget child, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 1 / 3,
      width: MediaQuery.of(context).size.width * 3 / 4,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    var routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    Function addFave = routeArgs['addFavorite'];
    var thisMeal = DUMMY_RECIPES.firstWhere(
      (meal) {
        return meal.id == routeArgs['id'];
      },
    );
    var image = Image.network(
      thisMeal.imageURL,
      width: double.infinity,
      fit: BoxFit.cover,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(thisMeal.name),
        backgroundColor: routeArgs['color'],
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.star, color: Colors.white,),
            disabledColor: Colors.grey,
            onPressed: () {addFave(routeArgs['id']);},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 2 / 5,
              width: double.infinity,
              child: Image.network(
                thisMeal.imageURL,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle('Ingredients', context),
            buildItemWraper(
                ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: Card(
                        color: Theme.of(context).accentColor,
                        child: Padding(
                          padding: EdgeInsets.all(4),
                          child: Row(
                            children: <Widget>[
                              Container(
                                child: Text(
                                  '${thisMeal.ingredients[index]['amount']} ',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  softWrap: true,
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                              Container(
                                child: Text(
                                  '${thisMeal.ingredients[index]['ingredient']}',
                                  style: TextStyle(
                                    fontSize: 17,
                                  ),
                                  softWrap: true,
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: thisMeal.ingredients.length,
                ),
                context),
            buildSectionTitle('Steps', context),
            buildItemWraper(
                ListView.builder(
                  itemCount: thisMeal.preparationSteps.length,
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: <Widget>[
                        ListTile(
                          leading: CircleAvatar(
                            child: Text(
                              (index + 1).toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            backgroundColor: routeArgs['color'],
                          ),
                          title: Text(
                            thisMeal.preparationSteps[index],
                          ),
                        ),
                        Divider(
                          thickness: 3,
                        )
                      ],
                    );
                  },
                ),
                context)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.of(context).pop(thisMeal.id);
        },
      ),
    );
  }
}
