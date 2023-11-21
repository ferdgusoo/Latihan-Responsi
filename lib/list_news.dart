import 'package:flutter/material.dart';
import 'package:latihanresponsi/api_data_source.dart';
import 'package:latihanresponsi/news_models.dart';
import 'package:latihanresponsi/details_news.dart';

class PageListNews extends StatefulWidget {
  const PageListNews({super.key});

  @override
  State<PageListNews> createState() => _PageListNewsState();
}

class _PageListNewsState extends State<PageListNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("NEWS LIST"),
      ),
      body: _buildListNewsBody(),
    );
  }

  Widget _buildListNewsBody() {
    return Container(
      child: FutureBuilder(
          future: ApiDataSource.instance.loadNews(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              return _buildErrorSection();
            }
            if (snapshot.hasData) {
              NewsModels news = NewsModels.fromJson(snapshot.data);
              return _buildSuccessSection(news);
            }
            return _buildLoadingSection();
          }),
    );
  }

  Widget _buildErrorSection() {
    return Center(
      child: Text("Error"),
    );
  }

  Widget _buildSuccessSection(NewsModels data) {
    return ListView.builder(
        itemCount: data.results!.length,
        itemBuilder: (BuildContext context, int index) {
          return _BuildItemNews(data.results![index]);
        });
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _BuildItemNews(Results News) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PageDetailNews(news: News),
          ),
        );
      },
      child: Card(
        color: Colors.blue[100],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 120,
              child: Image.network(News.imageUrl!),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 150,
                    child: Text(News.title!))
              ],
            )
          ],
        ),
      ),
    );
  }
}