// import 'package:demo/text.dart';
import 'package:demo/model/data_model.dart';
import 'package:demo/services/api.dart';
import 'package:demo/services/get_data.dart';
import 'package:demo/widgets/card_item.dart';
import 'package:demo/widgets/sch_appbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

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
      ),
      // home: SchAppbar(),
      routes: {
        "appbar": (context) => SchAppbar(),
      },
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) {
          return SchAppbar();
        });
      },
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;
  late DataModel dataModel;
  late List<Data> _list = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  Future _getData() async {
    Dio dio = Dio();
    Response response;
    // BaseOptions options = BaseOptions(headers: {"token":"dsadsa"});
    response = await dio.get(API.getData);
    dataModel = DataModel.fromJson(response.data);
    _list = dataModel.list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: _getData(),
          builder: (context, snapshot) {
            return snapshot.connectionState == ConnectionState.done
                ? ListView.builder(
                    itemCount: _list.length,
                    itemBuilder: (context, index) {
                      return CardItem(_list[index]);
                    })
                : const Center(
                    child: Text("正在加载中哦~"),
                  );
          }),
      //  Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       const Text(
      //         'You have pushed the button this many times:',
      //       ),
      //       Text(
      //         '$_counter',
      //         style: Theme.of(context).textTheme.headline4,
      //       ),
      //       ElevatedButton.icon(
      //           onPressed: () {
      //             Navigator.pushNamed(context, 'appbar');
      //           },
      //           icon: Icon(Icons.arrow_back),
      //           label: Text("跳转")),

      //       // Flow(delegate: ),
      //     ],
      //   ),
      // ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
