import 'package:favorr/view/page/profile_page/profile_page.dart';
import 'package:favorr/view/page/upload_post_page/upload_post_page.dart';
import 'package:favorr/view/widget/post_widget.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class AreaPage extends StatefulWidget {
  final page_name;
  const AreaPage({Key? key, required this.page_name}) : super(key: key);

  @override
  State<AreaPage> createState() => _AreaPageState();
}

class _AreaPageState extends State<AreaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
        centerTitle: true,
        title: Column(children: [
          Text(
            widget.page_name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
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
