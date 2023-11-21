import 'package:flutter/material.dart';
import 'package:latihanresponsi/api_data_source.dart';
import 'package:latihanresponsi/blogs_models.dart';
import 'package:latihanresponsi/details_blogs.dart';


class PageListBlogs extends StatefulWidget {
  const PageListBlogs({super.key});

  @override
  State<PageListBlogs> createState() => _PageListBlogsState();
}

class _PageListBlogsState extends State<PageListBlogs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("BLOGS LIST"),
      ),
      body: _buildListBlogsBody(),
    );
  }

  Widget _buildListBlogsBody() {
    return Container(
      child: FutureBuilder(
          future: ApiDataSource.instance.loadBlogs(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              return _buildErrorSection();
            }
            if (snapshot.hasData) {
              BlogsModels blogs = BlogsModels.fromJson(snapshot.data);
              return _buildSuccessSection(blogs);
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

  Widget _buildSuccessSection(BlogsModels data) {
    return ListView.builder(
        itemCount: data.results!.length,
        itemBuilder: (BuildContext context, int index) {
          return _BuildItemUsers(data.results![index]);
        });
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _BuildItemUsers(Results Blogs) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PageDetailBlogs(blog: Blogs),
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
              child: Image.network(Blogs.imageUrl!),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 150,
                    child: Text(Blogs.title!, style: TextStyle(fontSize: 15,),))
              ],
            )
          ],
        ),
      ),
    );
  }
}