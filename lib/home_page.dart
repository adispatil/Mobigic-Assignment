import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? _m = 1;
  int? _n = 1;
  String userInput = "";
  String searchInput = "";

  String getCharacter(int index){
    if(index < userInput.length) {
      return userInput[index];
    } else {
      return '*';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mobigic Test'),),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Text(
                'Enter Matrix value',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          setState(() {
                            _m = int.parse(value);
                          });
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'm',
                          hintText: 'Enter row count',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text('x'),
                    SizedBox(
                      width: 5,
                    ),
                    Flexible(
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            _n = int.parse(value);
                          });
                        },
                        obscureText: false,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'n',
                          hintText: 'Enter column count',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              /// Draw matrix button
              // _buildDrawMatrixButton(context),

              /// characters for matrix
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: Flexible(
                  child: TextField(
                    maxLength: (_m??0) * (_n??0),
                    textCapitalization: TextCapitalization.characters,
                    onChanged: (value) {
                      setState(() {
                        userInput = value;
                      });
                    },
                    obscureText: false,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter characters for matrix',
                      hintText: 'Enter characters for matrix',
                    ),
                  ),
                ),
              ),

              /// user search input
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: Flexible(
                  child: TextField(
                    maxLength: 1,
                    textCapitalization: TextCapitalization.characters,
                    onChanged: (value) {
                      setState(() {
                        searchInput = value;
                      });
                    },
                    obscureText: false,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                      labelText: 'Search for character from matrix',
                      hintText: 'Search for character from matrix',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: ((_m ?? 0) * (_n ?? 0)),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 3,
                    mainAxisSpacing: 3,
                    crossAxisCount: _n ?? 0,
                  ),
                  itemBuilder: (context, index) {
                    return Center(
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        
                        decoration: BoxDecoration(
                          color: getCharacter(index) == searchInput ? Colors.lightBlueAccent : Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(color: Colors.blueAccent),
                        ),
                        child: Center(
                          child: Text(
                            getCharacter(index),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0,
                          
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _buildDrawMatrixButton(BuildContext context) {
    return SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 40.0,
              child: ElevatedButton(
                onPressed: () {
                  if (_m != null && _n != null && _m! > 0 && _n! > 0) {
                    _drawMatrix(_m ?? 0, _n ?? 0);
                  } else {
                    Get.defaultDialog(
                      title: 'Invalid input',
                      barrierDismissible: true,
                      middleText: 'Please enter valid input for matrix',
                      textConfirm: "Ok",
                      confirm: dialogConfirmButton(),
                    );
                  }
                },
                child: Text('Draw Matrix'),
              ),
            );
  }

  Widget dialogConfirmButton() {
    return ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: Text("Confirm"));
  }

  /// Draw matrix
  void _drawMatrix(int m, int n) {}
}
