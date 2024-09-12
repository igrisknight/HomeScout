import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.system,
      home: const AppHome(),
    );
  }
}

class AppHome extends StatelessWidget{
  const AppHome({super.key});
  
  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('HomeScout'), leading: const Icon(Icons.ondemand_video),),
      floatingActionButton:  FloatingActionButton(onPressed: () {  }, child: const Icon(Icons.add_shopping_cart_outlined),),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Text("Heading", style: Theme.of(context).textTheme.displayMedium,),
            const Text("Sub-heading"),
            const Text("paragraph"),
            ElevatedButton(onPressed: () {}, child: const Text("Elevated Button"),),
            OutlinedButton(onPressed: (){}, child: const Text("Outlined Button"),),
            const Padding(padding: EdgeInsets.all(20.0),
              child: Image(image: AssetImage("assets/images/HomeScout_logo.png")),
            )
          ],
        ),
      ),
    );
  }
}