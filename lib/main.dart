import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:movietask/view/nowplayingview.dart';

void main() => runApp(HomePage());

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: Icon(Icons.arrow_back_ios),
            title: Text(
              'Movies',
              style: TextStyle(fontSize: 16.0),
            ),
            bottom: PreferredSize(
                child: TabBar(
                    isScrollable: true,
                    unselectedLabelColor: Colors.white.withOpacity(0.3),
                    indicatorColor: Colors.white,
                    tabs: [
                      Tab(
                        child: Text('Tab 1'),
                      ),
                      Tab(
                        child: Text('Investment'),
                      ),
                      Tab(
                        child: Text('Your Earning'),
                      ),
                      Tab(
                        child: Text('Current Balance'),
                      ),
                      Tab(
                        child: Text('Tab 5'),
                      ),
                      Tab(
                        child: Text('Tab 6'),
                      )
                    ]),
                preferredSize: Size.fromHeight(30.0)),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Icon(Icons.search),
              ),
            ],
          ),
          body: TabBarView(
            children: <Widget>[
              NowPlayingMoviesList(),
              Container(
                child: Center(
                  child: Text('Tab 2'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Tab 3'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Tab 4'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Tab 5'),
                ),
              ),
              Container(
                child: Center(
                  child: Text('Tab 6'),
                ),
              ),
            ],
          )),
    );
  }
}
