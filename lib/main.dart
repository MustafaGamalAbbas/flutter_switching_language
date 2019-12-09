import 'package:flutter/material.dart';
import 'package:switch_language_itsharks/switch_language_localization.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var dropdownValue = "English";
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(32),
        child: FutureBuilder(
            future: MyAppLocalization.load(dropdownValue),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print("true");
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 50,
                      child: ClipOval(child: Image.asset("images/piso.jpg")),
                    ),
                    Row(
                      textDirection: dropdownValue == "English"
                          ? TextDirection.ltr
                          : TextDirection.rtl,
                      children: <Widget>[
                        Text(MyAppLocalization.translate("namelabel"),
                            style: Theme.of(context)
                                .textTheme
                                .title
                                .copyWith(fontSize: 24)),
                        Text(
                          MyAppLocalization.translate("name"),
                          style: Theme.of(context)
                              .textTheme
                              .title
                              .copyWith(color: Colors.black87),
                        ),
                      ],
                    ),
                    Row(
                      textDirection: dropdownValue == "English"
                          ? TextDirection.ltr
                          : TextDirection.rtl,
                      children: <Widget>[
                        Text(MyAppLocalization.translate("agelabel"),
                            style: Theme.of(context)
                                .textTheme
                                .title
                                .copyWith(fontSize: 24)),
                        Text(
                          MyAppLocalization.translate("age"),
                          style: Theme.of(context)
                              .textTheme
                              .title
                              .copyWith(color: Colors.black87),
                        ),
                      ],
                    ),
                    Row(
                      textDirection: dropdownValue == "English"
                          ? TextDirection.ltr
                          : TextDirection.rtl,
                      children: <Widget>[
                        Text(MyAppLocalization.translate("genderlabel"),
                            style: Theme.of(context)
                                .textTheme
                                .title
                                .copyWith(fontSize: 24)),
                        Text(
                          MyAppLocalization.translate("gender"),
                          style: Theme.of(context)
                              .textTheme
                              .title
                              .copyWith(color: Colors.black87),
                        ),
                      ],
                    ),
                    Row(
                      textDirection: dropdownValue == "English"
                          ? TextDirection.ltr
                          : TextDirection.rtl,
                      children: <Widget>[
                        Text(MyAppLocalization.translate("collagelabel"),
                            style: Theme.of(context)
                                .textTheme
                                .title
                                .copyWith(fontSize: 24)),
                        Text(
                          MyAppLocalization.translate("collage"),
                          style: Theme.of(context)
                              .textTheme
                              .title
                              .copyWith(color: Colors.black87),
                        ),
                      ],
                    ),
                    Row(
                      textDirection: dropdownValue == "English"
                          ? TextDirection.ltr
                          : TextDirection.rtl,
                      children: <Widget>[
                        Text(MyAppLocalization.translate("addresslabel"),
                            style: Theme.of(context)
                                .textTheme
                                .title
                                .copyWith(fontSize: 24)),
                        Text(
                          MyAppLocalization.translate("address"),
                          style: Theme.of(context)
                              .textTheme
                              .title
                              .copyWith(color: Colors.black87),
                        ),
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        elevation: 4,
                        color: Color(0xffEF812D),
                        onPressed: () {},
                        child: Container(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            hint: Text(
                              dropdownValue,
                              style: TextStyle(color: Colors.white),
                            ),
                            value: null,
                            icon: Icon(
                              Icons.language,
                              color: Colors.white,
                            ),
                            iconSize: 24,
                            elevation: 16,
                            style: TextStyle(color: Colors.black),
                            underline: Container(
                              height: 2,
                              color: Colors.transparent,
                            ),
                            onChanged: (String newValue) async {
                              setState(() {});
                              print(newValue);

                              setState(() {
                                dropdownValue = newValue;
                              });
                            },
                            items: <String>[
                              'العربية',
                              'English',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                  value: value,
                                  child: new Theme(
                                    data: Theme.of(context).copyWith(
                                        canvasColor:
                                            Theme.of(context).primaryColor),
                                    child: // Your Dropdown Code Here,

                                        Text(
                                      value,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ));
                            }).toList(),
                          ),
                        )),
                      ),
                    ),
                  ],
                );
              } else {
                print("object");
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
