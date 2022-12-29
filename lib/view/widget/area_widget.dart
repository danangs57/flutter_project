import 'package:favorr/model/AreaModel.dart';
import 'package:favorr/view/page/area_page/area_page.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class AreaWidget extends StatefulWidget {
  final String name;
  const AreaWidget({Key? key, required this.name}) : super(key: key);

  @override
  State<AreaWidget> createState() => _AreaWidgetState();
}

class _AreaWidgetState extends State<AreaWidget> {
  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onPressed: () => {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return AreaPage(page_name: widget.name);
        }))
      },
      margin: EdgeInsets.only(right: 10),
      child: Center(child: Text(widget.name)),
      style: NeumorphicStyle(
          depth: 15,
          lightSource: LightSource.topLeft,
          shape: NeumorphicShape.flat,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(5))),
    );
  }
}
