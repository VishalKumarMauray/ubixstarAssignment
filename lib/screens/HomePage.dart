import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ubixstar/provider/HomeProvider.dart';
import 'package:ubixstar/screens/AddWidgetPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeProvider home;

  @override
  void initState() {
    home = context.read<HomeProvider>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: 1.sw,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Assignment App",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  width: 1.sw,
                  decoration: BoxDecoration(
                    color: const Color(0xff7fffd4).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 20),
                    child: ValueListenableBuilder(
                      valueListenable: home.isTextAdded,
                      builder: (context, bool textAdded, child) {
                        return ValueListenableBuilder(
                          valueListenable: home.isImageAdded,
                          builder: (context, bool imageAdded, child) {
                            return ValueListenableBuilder(
                              valueListenable: home.isButtonAdded,
                              builder: (context, bool buttonAdded, child) {
                                return ValueListenableBuilder(
                                  valueListenable: home.onlyButtonAdded,
                                  builder: (context,bool onlyButton,_) {
                                    return Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        if(textAdded == false && imageAdded == false && buttonAdded == false)
                                          Center(child: Text("No widget is added",
                                            textAlign:TextAlign.center,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20,
                                            ),),),
                                        if (textAdded)
                                          Container(
                                            width: 1.sw,
                                            padding: const EdgeInsets.all(10),
                                            color: Colors.grey.withOpacity(0.2),
                                            child: const Text(
                                              'Enter Text',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        imageAdded ?
                                          Container(
                                            width: 1.sw,
                                            height: 0.4.sh,
                                            padding: const EdgeInsets.all(10),
                                            color: Colors.grey.withOpacity(0.2),
                                            child: const Center(
                                                child: Text(
                                              'Upload Image',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500),
                                            )),
                                          ) : onlyButton ?
                                          SizedBox(
                                            height: 0.4.sh,
                                            child: Text("Add at-least a widget to save",
                                            textAlign:TextAlign.center,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20,
                                            ),),
                                          ) :
                                            SizedBox(
                                              height: 0.4.sh,
                                            ),
                                        const SizedBox(
                                          height: 40,
                                        ),
                                        if (buttonAdded)
                                          GestureDetector(
                                            onTap: () {
                                              if (home.isTextAdded.value || home.isImageAdded.value) {
                                                if(home.isTextAdded.value && home.isImageAdded.value){
                                                  FirebaseFirestore.instance
                                                      .collection('data')
                                                      .add({'text': 'text and image is added'});
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(const SnackBar(
                                                    content: Text(
                                                      'Saved Successfully!',
                                                      style: TextStyle(
                                                          color: Colors.green,
                                                          fontWeight:
                                                          FontWeight.w600),
                                                    ),
                                                    backgroundColor:
                                                    Color(0xff7fffd4),
                                                  ));
                                                }else if(home.isTextAdded.value){
                                                  FirebaseFirestore.instance
                                                      .collection('data')
                                                      .add({'text': 'text is added'});
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(const SnackBar(
                                                    content: Text(
                                                      'Saved Successfully!',
                                                      style: TextStyle(
                                                          color: Colors.green,
                                                          fontWeight:
                                                          FontWeight.w600),
                                                    ),
                                                    backgroundColor:
                                                    Color(0xff7fffd4),
                                                  ));
                                                }else if(home.isImageAdded.value){
                                                  FirebaseFirestore.instance
                                                      .collection('data')
                                                      .add({'text': 'image is added'});
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(const SnackBar(
                                                    content: Text(
                                                      'Saved Successfully!',
                                                      style: TextStyle(
                                                          color: Colors.green,
                                                          fontWeight:
                                                          FontWeight.w600),
                                                    ),
                                                    backgroundColor:
                                                    Color(0xff7fffd4),
                                                  ));
                                                }
                                              }else{
                                                home.onlyButtonAdded.value = true;
                                              }
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 20, vertical: 10),
                                              decoration: BoxDecoration(
                                                  color: const Color(0xff7fffd4),
                                                  border: Border.all(
                                                    width: 1.5,
                                                  )),
                                              child: const Text('Save'),
                                            ),
                                          ),
                                      ],
                                    );
                                  }
                                );
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          const MaterialStatePropertyAll(Color(0xff7fffd4)),
                      side: MaterialStatePropertyAll(BorderSide(
                          color: Colors.black.withOpacity(0.6), width: 1.5))),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Provider.value(
                              value: home,
                              child: const AddWidgetPage(),
                            )));
                  },
                  child: const Text(
                    "Add Widgets",
                    style: TextStyle(color: Colors.black),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
