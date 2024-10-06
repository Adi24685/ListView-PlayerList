import 'package:flutter/material.dart';
void main(){
  runApp(const MyApp());
}

class MyApp extends StatefulWidget{
  const MyApp({super.key});

  @override
   State createState() => _MyAppState();
}

class _MyAppState extends State{
   TextEditingController nameController = TextEditingController();
    
    String? myName;
     List<String> Playerlist = [];
    @override
  Widget build(BuildContext context){
    return MaterialApp(
                home:Scaffold(
                  appBar: AppBar(
                    title: const Text(
                      " TextField ListView Demo",
                       style: TextStyle(
                        fontSize: 30,
                       ),
                    ),
                    centerTitle: true,
                    backgroundColor: Colors.blue,
                  ),
                  body: Column(
                    children: [
                      const SizedBox(
                        height:30,
                      ),
                           Padding(
                            padding: const EdgeInsets.all(20.0),
                              child: TextField(
                                   controller: nameController,
                                     style: const TextStyle(
                                       fontSize: 30,
                                     ),
                                     decoration: const InputDecoration(
                                      hintText: "ENterName",
                                      hintStyle: TextStyle(
                                        fontSize: 25,
                                      ),
                                      border: OutlineInputBorder(),
                                     ),
                                     onChanged:(String val){
                                       print("Value: $val");
                                     },
                                      onEditingComplete: (){
                                        print("Editing Colmplete");
                                      },
                                      onSubmitted: (value){
                                         print("Value Submitted: $value");
                                      },
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap:(){
                                print("Add Data");

                                myName = nameController.text.trim();
                                 print("My Name: $myName");
                                   if(myName != ""){
                                    Playerlist.add(myName!);
                                    print("PlayerList length: ${Playerlist.length}");
                                       nameController.clear();
                                         setState(() {} );
                                   }
                              } ,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                        vertical: 5,
                                  ),
                                   decoration: BoxDecoration(
                                    color: Colors.blue,
                                     borderRadius: BorderRadius.circular(15),
                                   ),
                                   child: const Text( 
                                      "Add Data",
                                        style: TextStyle(
                                          fontSize: 25,
                                          color: Colors.white,
                                        ),
                                   ),
                                ),
                            ),
                             const SizedBox(
                              height: 40,
                             ),
                             ListView.builder(
                              itemCount: Playerlist.length,
                                 shrinkWrap: true,
                                   itemBuilder: (context, index){
                                    return Text(
                                      "Name: ${Playerlist[index]}",
                                         style: const TextStyle(
                                          fontSize: 25,
                                         )
                                    );
                                   }
                             )
                    ],
                    )
                ),
    );
  }
}