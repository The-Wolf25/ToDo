import 'package:app3/screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class colors extends StatefulWidget {
  const colors({Key? key}) : super(key: key);

  @override
  State<colors> createState() => _colorsState();
}

class _colorsState extends State<colors> {
  bool yellowtheme = false;
  bool bluetheme = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: (yellowtheme)
            ? Colors.amberAccent
            : (bluetheme)
                ? Colors.blue
                : Color.fromARGB(255, 230, 38, 38),
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => home()));
            },
            icon: Icon(Icons.arrow_back)),
        centerTitle: true,
        title: Text(
          'Theme Colors',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          margin: EdgeInsets.only(top: 150),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Container(
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        bluetheme = true;
                        setState(() {});
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          leading: Icon(Icons.color_lens),
                          title: Text('Blue'),
                          tileColor: Colors.blue,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        yellowtheme = true;
                        setState(() {});
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          leading: Icon(Icons.color_lens),
                          title: Text('Yellow'),
                          tileColor: Colors.yellow,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 140),
                          child: Text(
                            'Page Under Construction',
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
