import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ubixstar/provider/HomeProvider.dart';

class AddWidgetPage extends StatefulWidget {
  const AddWidgetPage({super.key});

  @override
  State<AddWidgetPage> createState() => _AddWidgetPageState();
}

class _AddWidgetPageState extends State<AddWidgetPage> {

  late HomeProvider home;

  @override
  void initState() {
    home = context.read<HomeProvider>();
    super.initState();
    home.onlyButtonAdded.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: 1.sh,
          width: 1.sw,
          color: Color(0xff7fffd4).withOpacity(0.2),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0,vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 30,),
                Column(
                  children: [
                    ValueListenableBuilder(
                      valueListenable: home.isTextAdded,
                      builder: (context,bool added,_) {
                        return GestureDetector(
                            onTap: () {
                              home.isTextAdded.value = !home.isTextAdded.value;
                            },
                            child: Content(tittle: 'Text Widget',added: added,));
                      }
                    ),
                    SizedBox(height: 40,),
                    ValueListenableBuilder(
                        valueListenable: home.isImageAdded,
                        builder: (context,bool added,_) {
                          return GestureDetector(
                              onTap: () {
                                home.isImageAdded.value = !home.isImageAdded.value;
                              },
                              child: Content(tittle: 'Image Widget',added: added,));
                        }
                    ),
                    SizedBox(height: 40,),
                    ValueListenableBuilder(
                        valueListenable: home.isButtonAdded,
                        builder: (context,bool added,_) {
                          return GestureDetector(
                              onTap: () {
                                home.isButtonAdded.value = !home.isButtonAdded.value;
                              },
                              child: Content(tittle: 'Button Widget',added: added,));
                        }
                    ),
                  ],
                ),
               SizedBox(height: 30,),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Color(0xff7fffd4)),
                        side: MaterialStatePropertyAll(BorderSide(
                            color: Colors.black.withOpacity(0.6),
                            width: 1.5
                        ))
                    ),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Text("Import Widgets",style: TextStyle(color: Colors.black),)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Content extends StatelessWidget {
  final String tittle;
  final bool added;
  const Content({super.key, required this.tittle, required this.added});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.white,
            child: CircleAvatar(
              radius: 10,
              backgroundColor:added ? Colors.greenAccent: Colors.grey.withOpacity(0.6),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              color: Colors.grey.withOpacity(0.6),
              child: Text(tittle,style: TextStyle(fontWeight: FontWeight.w600),),
            ),
          ),
        ],
      )
    );
  }
}
