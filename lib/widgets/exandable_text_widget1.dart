import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/small_text.dart';

class ExpandableTextWidget1 extends StatefulWidget {
  final String text;

  const ExpandableTextWidget1({Key? key, required this.text}) : super(key: key);

  @override
  _ExpandableTextWidgetState createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget1> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;

  double textHeight = Dimensions.screenHeight * 0.2;

  @override
  void initState() {
    super.initState();
    print("textHeight" + textHeight.toString());
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? Text(
              firstHalf,
              style: TextStyle(
                fontSize: 16,
                fontFamily: "Roboto",
                height: 1.5,
              ),
            )
          : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hiddenText ? (firstHalf + "...") : firstHalf + secondHalf,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Roboto",
                    height: 1.5,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Text(
                    "Read more ...",
                    style: TextStyle(
                      color: Colors.blue,
                    ),

                  ),
                ),
              ],
            ),
    );
  }
}
