import 'package:flutter/material.dart';
import 'package:latihanresponsi/list_blogs.dart';
import 'package:latihanresponsi/list_news.dart';
import 'package:latihanresponsi/list_reports.dart';

class HalamanUtama extends StatefulWidget {
  const HalamanUtama({Key? key}) : super(key: key);

  @override
  State<HalamanUtama> createState() => _MenuUtama();
}

class _MenuUtama extends State<HalamanUtama> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.blue[900],
              title: Center(
                child:Column (
                  children: [
                    Text ('SPACE FLIGHT NEWS'),
                  ],
                ),
              ),
            ),

            body: GridView.count(
                padding: const EdgeInsets.all(10),
                crossAxisCount: 1,
                children: <Widget>[
                  Card(
                    margin: const EdgeInsets.all(8),
                    child: InkWell(
                      onTap: (){},
                      child: ElevatedButton(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor: Colors.blue[900],
                              backgroundImage: AssetImage('assets/news.jpeg'),
                              radius: 100,
                            ),
                            Text("News",
                              style: TextStyle(fontSize: 35, color: Colors.black54, fontWeight: FontWeight.bold,),
                            ),
                            Text('Get an overview of the latest Spaceflight news, from various sources! Easily link your users to the right websites',
                                textAlign: TextAlign.justify,
                                style:TextStyle(fontSize: 20,color: Colors.white))
                          ],
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PageListNews()),
                          );
                        },

                      ),
                    ),
                  ),

                  Card(
                    margin: const EdgeInsets.all(8),
                    child: InkWell(
                      onTap: (){},
                      splashColor: Colors.white70,
                      child: ElevatedButton(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage: AssetImage('assets/blogs.jpeg'),
                              radius: 100,
                            ),
                            Text("Blog", style: TextStyle(fontSize: 35, color: Colors.black54, fontWeight: FontWeight.bold,)),
                            Text('Blogs often provide a more detailed overview of launches and missions. A must-have for the serious spaceflight enthusiast',
                                textAlign: TextAlign.justify,
                                style:TextStyle(fontSize: 20,color: Colors.white))
                          ],
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PageListBlogs()),
                          );
                        },

                      ),
                    ),
                  ),

                  Card(
                    margin: const EdgeInsets.all(8),
                    child: InkWell(
                      onTap: (){},
                      splashColor: Colors.white70,
                      child: ElevatedButton(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const <Widget>[
                            CircleAvatar(
                              backgroundImage: AssetImage('assets/reports.jpeg'),
                              radius: 100,
                            ),
                            Text("Reports", style: TextStyle(fontSize: 35, color: Colors.black54, fontWeight: FontWeight.bold,)),
                            Text('Space station and other missions often publish their data. With SNAPI, you can include it in your app as well!',
                                textAlign: TextAlign.justify,
                                style:TextStyle(fontSize: 20,color: Colors.white))
                          ],
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PageListReports()),
                          );
                        },

                      ),
                    ),
                  ),

                ]
            )
        )
    );
  }
}