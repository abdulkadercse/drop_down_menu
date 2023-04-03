import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //1st dropDownMenu
  List<String> dropDownMenuItem = [
    "A",
    "B",
    "C",
    "D",
    "E",
  ];
  var selectedValue;

  //2nd dropDownMenu
  List<String> languages = ['English', 'Bangla'];
  String initialLanguage = 'English';

  DropdownButton<String> getLanguages() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String des in languages) {
      var item = DropdownMenuItem(
        value: des,
        child: Text(des),
      );
      dropDownItems.add(item);
    }
    return DropdownButton(
      items: dropDownItems,
      value: initialLanguage,
      onChanged: (value) {
        setState(() {
          initialLanguage = value!;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("DropDownMenu"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: DropdownButton(
                    icon: const Icon(Icons.arrow_drop_down_sharp),
                    hint: const Text("Choose"),
                    items: dropDownMenuItem
                        .map((item) =>
                            DropdownMenuItem(value: item, child: Text(item)))
                        .toList(),
                    value: selectedValue,
                    onChanged: (val) {
                      setState(() {
                        selectedValue = val;
                      });
                    }),
              ),
              const SizedBox(
                height: 10,
              ),
              //second dropDownMenu
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(color: Colors.grey),
                ),
                child: SizedBox(
                  height: 55,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: DropdownButtonHideUnderline(child: getLanguages()),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
