import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/exandable_text_widget1.dart';

class BodyCalender extends StatelessWidget {
  final Model model;

  const BodyCalender({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1000,
      color: Colors.white24,
      padding: EdgeInsets.all(20),
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  model.name,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                height: 30,
                width: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  color: Colors.red.withOpacity(0.2),
                ),
                child: Center(
                  child: Text(
                    model.tag,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
          ListTile(
            contentPadding: EdgeInsets.all(0),
            leading: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.calendar_today_outlined,
                color: Colors.redAccent,
              ),
            ),
            title: Text(
              model.nameTime,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              model.time,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.all(0),
            leading: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.all_inclusive,
                color: Colors.redAccent,
              ),
            ),
            title: Text(
              model.onlineTime,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              model.httpOnline,
              style: TextStyle(
                fontSize: 14,
                color: Colors.blue,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "About Event",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          ExpandableTextWidget1(text: model.about),
          SizedBox(
            height: 20,
          ),
          Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height*0.5,
              minHeight: 25,
            ),
            child: ListView.builder(
              shrinkWrap: true,
                physics:  NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
              return ListTile(
                contentPadding: EdgeInsets.all(0),
                leading: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(
                    model.listSpeaker[index].img,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  model.listSpeaker[index].name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  model.listSpeaker[index].work,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              );
            },
            itemCount:model.listSpeaker.length,),
          ),
          SizedBox(height: 20,),
          Text(
            "Agenda",
            style: TextStyle(fontSize: 20),
          ),
          Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height*0.5,
              minHeight: 25,
            ),
            child: ListView.builder(
              shrinkWrap: true,
              physics:  NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: EdgeInsets.all(0),
                  title: Text(
                    model.listAgenda[index].name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    model.listAgenda[index].time,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                );
              },
              itemCount:model.listAgenda.length,),
          ),
        ],
      ),

    );
  }
}

class Model {
  final String name;
  final String tag;
  final String about;
  final String time;
  final String nameTime;
  final String onlineTime;
  final String httpOnline;
  final List<Speaker> listSpeaker;
  final List<Agenda> listAgenda;

  Model({
    required this.name,
    required this.tag,
    required this.about,
    required this.listSpeaker,
    required this.listAgenda,
    required this.time,
    required this.nameTime,
    required this.httpOnline,
    required this.onlineTime,
  });
}

class Speaker {
  final String img;
  final String name;
  final String work;

  Speaker({required this.img, required this.name, required this.work});
}

class Agenda {
  final String name;
  final String time;

  Agenda({required this.name, required this.time});
}
