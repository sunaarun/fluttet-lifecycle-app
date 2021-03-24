import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget{
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  //WidgetBindingObserver : Interface for classes that register with the Widgets layer binding.

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    /*
    1- BindingWidget :is the glue between the widgets layer and the Flutter engine.
    2- WidgetBinding.instance : is a static property that present the current WidgetBinding, if one has been created
    3- We register our class as observer, by pass our class or State(this) as an argument to addObserver() method ,
     */
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state){
    print(state);
    /*
    1- Override the didChangeLifecycleState function
    2- print app lifecycle state whenever the State changes, or do what ever you want
     */
    if(state ==AppLifecycleState.inactive)
      {
        print('We are in Inactive state'); // this will print when tha app goes to inactive state
      }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    /*
    Un-register the given observer, in this case our State
     */
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'This is a Lifecycle Application\n',
            style: TextStyle(fontSize: 22,),),
           Text("📱📲" , style: TextStyle(fontSize:45),)
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
