import 'package:flutter/material.dart';

class MealAddStepDisplay extends StatefulWidget {
  final List<String> preparationSteps;

  MealAddStepDisplay(this.preparationSteps);

  @override
  _MealAddStepDisplayState createState() => _MealAddStepDisplayState();
}

class _MealAddStepDisplayState extends State<MealAddStepDisplay> {
  List<TextEditingController> _stepInputControllers = [TextEditingController()];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 3 / 4,
      height: MediaQuery.of(context).orientation == Orientation.landscape
          ? MediaQuery.of(context).size.height * 2 / 5
          : MediaQuery.of(context).size.height * 2 / 7,
      margin: EdgeInsets.only(
        bottom: 20,
      ),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColorLight,
          border: Border.all(
            color: Colors.grey,
            width: 5,
          ),
          borderRadius: BorderRadius.circular(20)),
      child: ListView.builder(
        itemBuilder: (BuildContext ctx, int index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text(
                (index + 1).toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              backgroundColor: Theme.of(context).primaryColor,
            ),
            title: TextField(
              controller: _stepInputControllers[index],
              decoration: InputDecoration(
                labelText: 'Step ${index + 1}',
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.check,
                    color: Colors.green,
                  ),
                  onPressed: () {
                    setState(() {
                      widget.preparationSteps[index] =
                          _stepInputControllers[index].text;
                      widget.preparationSteps.insert(index + 1, '');
                      _stepInputControllers.insert(
                          index + 1, TextEditingController());
                      //.add(TextEditingController());
                    });
                  },
                ),
                if (widget.preparationSteps.length > 1)
                  IconButton(
                      icon: Icon(
                        Icons.clear,
                        color: Theme.of(context).errorColor,
                      ),
                      onPressed: () {
                        setState(() {
                          widget.preparationSteps.removeAt(index);
                          _stepInputControllers.removeAt(index);
                        });
                      })
              ],
            ),
          );
        },
        itemCount: widget.preparationSteps.length,
      ),
    );
  }
}
