import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:favorr/model/AreaModel.dart';
import 'package:favorr/services/DBService.dart';
import 'package:favorr/view/page/area_page/area_page.dart';
import 'package:favorr/view/page/profile_page/profile_page.dart';
import 'package:favorr/view/page/upload_post_page/upload_post_page.dart';
import 'package:favorr/view/widget/area_widget.dart';
import 'package:favorr/view/widget/post_widget.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
        centerTitle: true,
        title: Column(children: [
          Text(
            "Faviorr",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            child: Text(
              'Bekasi Edition',
              style: TextStyle(fontSize: 12),
            ),
          )
        ]),
        leading: NeumorphicButton(
            onPressed: () => {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return ProfilePage();
                  }))
                },
            child: Icon(Icons.person)),
        actions: [
          NeumorphicButton(
            onPressed: () => {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return UploadPostPage();
              }))
            },
            child: Icon(Icons.add),
          )
        ],
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top: 5),
            height: 60,
            child: StreamBuilder<QuerySnapshot>(
                stream: Database.getAreas(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.separated(
                      padding: EdgeInsets.all(10),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        DocumentSnapshot datads = snapshot.data!.docs[index];
                        String name = datads['name'];
                        return AreaWidget(
                          name: name,
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(height: 2),
                      itemCount: snapshot.data!.docs.length,
                    );
                  } else if (snapshot.hasError) {
                    return Text('error');
                  }
                  return Center(child: CircularProgressIndicator());
                }),
          ),
          PostWidget(),
          PostWidget(),
          PostWidget(),
          PostWidget(),
          PostWidget(),
        ],
      ),
    );
  }
}
