import 'dart:convert';

import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lpinyin/lpinyin.dart';

class ContactListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ContactListPageState();
  }
}

class _ContactListPageState extends State<ContactListPage> {
  List<ContactInfo> contacts = [];
  double susItemHeight = 40;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    //加载联系人列表
    rootBundle.loadString('asset/contects.json').then((value) {
      List list = json.decode(value);
      list.forEach((v) {
        contacts.add(ContactInfo.fromJson(v));
      });
      _handleList(contacts);
    });
  }

  void _handleList(List<ContactInfo> list) {
    if (list.isEmpty) return;
    for (int i = 0, length = list.length; i < length; i++) {
      String pinyin = PinyinHelper.getPinyinE(list[i].name);
      String tag = pinyin.substring(0, 1).toUpperCase();
      list[i].namePinyin = pinyin;
      if (RegExp("[A-Z]").hasMatch(tag)) {
        list[i].tagIndex = tag;
      } else {
        list[i].tagIndex = "#";
      }
    }
    // A-Z sort.
    SuspensionUtil.sortListBySuspensionTag(contacts);

    // show sus tag.
    SuspensionUtil.setShowSuspensionStatus(contacts);

    // add header.
    contacts.insert(0, ContactInfo(name: 'header', tagIndex: '↑'));

    setState(() {});
  }



  Widget _buildSusWidget(String susTag) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      height: susItemHeight,
      width: double.infinity,
      alignment: Alignment.centerLeft,
      child: Row(
        children: <Widget>[
          Text(
            '$susTag',
            textScaleFactor: 1.2,
          ),
          Expanded(
              child: Divider(
                height: .0,
                indent: 10.0,
              ))
        ],
      ),
    );
  }

  Widget _buildListItem(ContactInfo model) {
    String susTag = model.getSuspensionTag();
    return Column(
      children: <Widget>[
        Offstage(
          offstage: model.isShowSuspension != true,
          child: _buildSusWidget(susTag),
        ),
        ListTile(
        
          title: Text(model.name),
          onTap: () {
            print("OnItemClick: $model");
            Navigator.pop(context, model);
          },
        )
      ],
    );
  }

  Decoration getIndexBarDecoration(Color color) {
    return BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: Colors.grey[300]!, width: .5));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AzListView(
        data: contacts,
        itemCount: contacts.length,
        itemBuilder: (BuildContext context, int index) {
          ContactInfo model = contacts[index];
          return _buildListItem(model);
        },
        physics: BouncingScrollPhysics(),
        indexBarData: SuspensionUtil.getTagIndexList(contacts),
        indexHintBuilder: (context, hint) {
          return Container(
            alignment: Alignment.center,
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
              color: Colors.blue[700]!.withAlpha(200),
              shape: BoxShape.circle,
            ),
            child:
            Text(hint, style: TextStyle(color: Colors.white, fontSize: 30.0)),
          );
        },
        indexBarMargin: EdgeInsets.all(10),
        indexBarOptions: IndexBarOptions(
          needRebuild: true,
          decoration: getIndexBarDecoration(Colors.grey[50]!),
          downDecoration: getIndexBarDecoration(Colors.grey[200]!),
        ),
      ),
    );
  }
}


class ContactInfo extends ISuspensionBean {
  String name;
  String? bankUrl;
  String? tagIndex;
  String? bankScript;
  String? namePinyin;

  Color? bgColor;
  IconData? iconData;

  String? bankImage;
  String? bankId;
  String? firstletter;

  ContactInfo({
    required this.name,
    this.bankUrl,
    this.bankScript,
    this.tagIndex,
    this.bgColor,
    this.iconData,
    this.namePinyin,
    this.bankImage,
    this.bankId,
    this.firstletter,
  });

  ContactInfo.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        bankImage = json['img'],
        bankId = json['id']?.toString(),
        firstletter = json['firstletter'],
  bankUrl = json['bankUrl'];

  Map<String, dynamic> toJson() => {
//        'id': id,
    'name': name,
    'img': bankImage,
    'bankId': bankId,
    'bankUrl': bankUrl,
//        'firstletter': firstletter,
//        'tagIndex': tagIndex,
//        'namePinyin': namePinyin,
//        'isShowSuspension': isShowSuspension
  };

  @override
  String getSuspensionTag() {
    return tagIndex!;
  }
}