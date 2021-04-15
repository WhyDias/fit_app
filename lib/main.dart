import 'package:flutter/material.dart';
import 'domain/workout.dart';

void main() => runApp(FitApp());

class FitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Max Fitness',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(65, 50, 75, 1),
        textTheme: TextTheme(
          title: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          title: Text('Fit App'),
          leading: Icon(Icons.fitness_center),
        ),
        body: WorkoutsList(),
      ),
    );
  }
}

class WorkoutsList extends StatelessWidget {
  final workouts = <Workout>[
    Workout(
        title: 'Test1',
        author: 'Dias1',
        description: 'Dias11',
        level: 'Beginner'),
    Workout(
        title: 'Test2',
        author: 'Dias2',
        description: 'Dias22',
        level: 'Intermediate'),
    Workout(
        title: 'Test3',
        author: 'Dias3',
        description: 'Dias33',
        level: 'Advanced'),
    Workout(
        title: 'Test4',
        author: 'Dias4',
        description: 'Dias44',
        level: 'Intermediate'),
    Workout(
        title: 'Test5',
        author: 'Dias5',
        description: 'Dias55',
        level: 'Advanced'),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: ListView.builder(
          itemCount: workouts.length,
          itemBuilder: (context, i) {
            return Card(
              elevation: 2.0,
              margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: Container(
                decoration:
                    BoxDecoration(color: Color.fromRGBO(65, 50, 75, .9)),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                  leading: Container(
                    padding: EdgeInsets.only(right: 12.0),
                    child: Icon(
                      Icons.fitness_center,
                      color: Theme.of(context).textTheme.title.color,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                          right: BorderSide(width: 1, color: Colors.white24)),
                    ),
                  ),
                  title: Text(
                    workouts[i].title,
                    style: TextStyle(
                      color: Theme.of(context).textTheme.title.color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right,
                      color: Theme.of(context).textTheme.title.color),
                  subtitle: subtitle(context, workouts[i]),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

Widget subtitle(BuildContext context, Workout workout) {
  var color = Colors.grey[200];
  double indicatorLevel = 0;

  switch (workout.level) {
    case 'Beginner':
      color = Colors.green;
      indicatorLevel = 0.33;
      break;
    case 'Intermediate':
      color = Colors.yellow;
      indicatorLevel = 0.66;
      break;
    case 'Advanced':
      color = Colors.red;
      indicatorLevel = 1;
      break;
  }
  return Row(
    children: <Widget>[
      Expanded(
        flex: 1,
        child: LinearProgressIndicator(
          backgroundColor: Theme.of(context).textTheme.title.color,
          value: indicatorLevel,
          valueColor: AlwaysStoppedAnimation(color),
        ),
      ),
      SizedBox(width: 10.0),
      Expanded(
        flex: 3,
        child: Text(
          workout.level,
          style: TextStyle(
            color: Theme.of(context).textTheme.title.color,
          ),
        ),
      ),
    ],
  );
}
