import 'package:flutter/material.dart';
import 'package:latihanresponsi/api_data_source.dart';
import 'package:latihanresponsi/reports_models.dart';
import 'package:latihanresponsi/details_reports.dart';


class PageListReports extends StatefulWidget {
  const PageListReports({super.key});

  @override
  State<PageListReports> createState() => _PageListReportsState();
}

class _PageListReportsState extends State<PageListReports> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("REPORTS LIST"),
      ),
      body: _buildListReportsBody(),
    );
  }

  Widget _buildListReportsBody() {
    return Container(
      child: FutureBuilder(
          future: ApiDataSource.instance.loadReports(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              return _buildErrorSection();
            }
            if (snapshot.hasData) {
              ReportsModels reports = ReportsModels.fromJson(snapshot.data);
              return _buildSuccessSection(reports);
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

  Widget _buildSuccessSection(ReportsModels data) {
    return ListView.builder(
        itemCount: data.results!.length,
        itemBuilder: (BuildContext context, int index) {
          return _BuildItemReports(data.results![index]);
        });
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _BuildItemReports(Results Reports) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PageDetailReports(report: Reports),
        ),
      ),
      child: Card(
        color: Colors.blue[100],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 120,
              child: Image.network(Reports.imageUrl!),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 150,
                    child: Text(Reports.title!))
              ],
            )
          ],
        ),
      ),
    );
  }
}