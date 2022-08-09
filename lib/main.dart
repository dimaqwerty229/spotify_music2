import 'package:flutter/material.dart';
import 'Services.dart';
import 'Post.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Albom>? alboms ;
  late bool loading;

  @override
  void initState(){
    super.initState();
    loading = true;
    Services.getAlboms().then((list) {
       setState(() {
         alboms = list;
         loading = false;
       });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(loading ? 'Loading... ' : 'Alboms'),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
            itemBuilder: (context, index){
              Albom abloom = alboms;
              return ListTile(
                title: Text(abloom.albumType),
                //subtitle: Text(abloom.href[index]),
              );
            }
            ),
      ),
    );
  }
}
