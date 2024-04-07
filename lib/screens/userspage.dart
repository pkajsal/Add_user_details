import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:user_details/constants/utils.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  Uint8List? _image;
  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  List<String> image = [
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  List<String> position = [
    "Martin Dokidis",
    "Marilyn Rosser",
    "Cristopher Lipshutz",
    "Wilson Botosh",
    "Philip Gouse",
    "Anika Saris",
  ];
  List<String> empid = [
    "Age:34",
    "Age:34",
    "Age:34",
    "Age:34",
    "Age:34",
    "Age:34",
  ];
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffEBEBEB),
        floatingActionButton: SizedBox(
          height: 60,
          width: 60,
          child: FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: Colors.white,
                    title: Text(
                      'Add a new user',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    content: SizedBox(
                      height: 300,
                      child: Column(
                        children: [
                          Image.asset("images/Group 18796.png"),
                          SizedBox(
                            height: 15,
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Name")),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 35,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Age")),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 35,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          )
                        ],
                      ),
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          // Close the dialog and cancel sign out
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Cancel',
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Save',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue),
                      ),
                    ],
                  );
                },
              );
            },
            child: Icon(
              Icons.add,
              size: 30,
              color: Colors.white,
            ),
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 80,
                color: Colors.black,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.white,
                    ),
                    Text(
                      "Nilambur",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Container(
                      width: 320,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            // Use OutlineInputBorder for border customization
                            borderRadius:
                                BorderRadius.circular(30), // Set borderRadius
                            borderSide:
                                BorderSide(), // You can customize the borderSide as well if needed
                          ),
                          prefixIcon: Icon(Icons.search_outlined),
                          hintText: 'Search',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                        onTap: () {
                          _showDialog(context);
                        },
                        child: Image.asset("images/Vector (1).png")),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "User Lists",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 1000,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: position.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        height: screenHeight * 0.10,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 1,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: screenWidth * 0.02),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage(image[index]),
                              ),
                              SizedBox(
                                width: screenWidth * 0.03,
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      position[index].toString(),
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.04,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.black),
                                    ),
                                    SizedBox(
                                      height: screenHeight * 0.005,
                                    ),
                                    Text(
                                      empid[index].toString(),
                                      style: TextStyle(
                                        fontSize: screenWidth * 0.03,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
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
}

void _showDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      int? _selectedValue = 1; // Variable to store the selected radio value

      return AlertDialog(
        backgroundColor: Colors.white,
        title: Text(
          'Sort',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            RadioListTile(
              title: Text('All'),
              value: 1,
              groupValue: _selectedValue,
              onChanged: (value) {
                // _selectedValue = value;
                // Navigator.of(context).pop();
              },
              activeColor: Colors.black,
            ),
            RadioListTile(
              title: Text('Age:Elder'),
              value: 2,
              groupValue: _selectedValue,
              onChanged: (value) {
                // _selectedValue = value;
                // Navigator.of(context).pop();
              },
            ),
            RadioListTile(
              title: Text('Age:Younger'),
              value: 3,
              groupValue: _selectedValue,
              onChanged: (value) {
                // _selectedValue = value;
                // Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    },
  );
}
