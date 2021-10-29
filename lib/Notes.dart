import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'Models/NotesPage.dart';

class NotesPage extends StatefulWidget {
  NotesPage({Key key}) : super(key: key);

  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  var _formKey = GlobalKey<FormState>();
  String st=editNoteHeading;
  
  /*getFromLoocal()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    
    setState(() {
      List<dynamic> temp = jsonDecode(prefs.getString("noteHeading")!);
      for(var t in temp)
      {
        tasks.add(noteHeading(t[""],t[""]));
      }
    });
  }
  saveinLocal() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("", jsonEncode());
  print(jsonEncode());
  
}
@override
  void initState() {
    getFromLoocal();
    super.initState();
  }*/

  @override
  void initState() {
    super.initState();
    notesDescriptionMaxLenth =
        notesDescriptionMaxLines * notesDescriptionMaxLines;
  }

  @override
  void dispose() {
    noteDescriptionController.dispose();
    noteHeadingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: notesHeader(),
       
      ),
      body: noteHeading.length > 0
          ? buildNotes()
          : Center(child: Text("Add Notes...",style: TextStyle(color: Colors.blueGrey[50],fontFamily: 'Gloria Hallelujah',fontSize:35),)),
      floatingActionButton: SizedBox(
        height:80,width:80,
        child: FloatingActionButton(
          mini: false,
          backgroundColor: Colors.blueGrey[50],
          onPressed: () {
            _settingModalBottomSheet(context);
          },
          child: Icon(Icons.create,color: Colors.blueGrey[900],size: 40,),
        ),
      ),
    );
  }

  Widget buildNotes() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 30,
        right: 30,
      ),
      child: new ListView.builder(
        itemCount: noteHeading.length,
        itemBuilder: (context, int index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 5.5),
            child: new Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.horizontal,
              onDismissed: (direction) {
                setState(() {
                  deletedNoteHeading = noteHeading[index];
                  deletedNoteDescription = noteDescription[index];
                  noteHeading.removeAt(index);
                  noteDescription.removeAt(index);
                  
                  // ignore: deprecated_member_use
                  Scaffold.of(context).showSnackBar(
                     SnackBar(
                      backgroundColor: Colors.orange,
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          new Text(
                            "Note Deleted",
                            style: TextStyle(),
                          ),
                          deletedNoteHeading != ""
                              ? GestureDetector(
                                  onTap: () {
                                    print("undo");
                                    setState(() {
                                      if (deletedNoteHeading != "") {
                                        noteHeading.add(deletedNoteHeading);
                                        noteDescription
                                            .add(deletedNoteDescription);
                                      }
                                      deletedNoteHeading = "";
                                      deletedNoteDescription = "";
                                    });
                                  },
                                  child: new Text(
                                    "Undo",
                                    style: TextStyle(),
                                  ),
                                )
                              : SizedBox(),
                        ],
                      ),
                    ),
                  );
                });
              },
              background: ClipRRect(
                borderRadius: BorderRadius.circular(5.5),
                child: Container(
                  color: Colors.green,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                          Text(
                            "Delete",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              secondaryBackground: ClipRRect(
                borderRadius: BorderRadius.circular(5.5),
                child: Container(
                  color: Colors.red,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                          Text(
                            "Delete",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              child: noteList(index),
            ),
          );
        },
      ),
    );
  }

  Widget noteList(int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5.5),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: noteColor[(index % noteColor.length).floor()],
          borderRadius: BorderRadius.circular(5.5),
        ),
        height: 300,
        child: Center(
          child: Row(
            children: [
               Container(
                color:
                    noteMarginColor[(index % noteMarginColor.length).floor()],
                width: 3.5,
                height: double.infinity,
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        
                        children: [
                          /*GestureDetector(onTap:(){
                            color:Colors.yellow;
                          },),*/
                          
                          Icon(Icons.description_rounded,
                          color: Colors.blueGrey[900],
                          size: 30.0,),
                        
                      
                      
                      Flexible(
                        child: Text(
                          noteHeading[index],
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 27.00,
                            color: Colors.blueGrey[900],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ],
                      ),
                      SizedBox(
                        height: 2.5,
                      ),
                      Flexible(
                        child: Container(
                          height: double.infinity,
                
                          child: AutoSizeText(
                            "${(noteDescription[index])}",
                            maxLines: 20,
                            overflow: TextOverflow.ellipsis,
                          
                            style: TextStyle(
                              fontSize: 15.00,
                              fontFamily: 'Gloria Hallelujah',
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Icon(Icons.edit,),
                        TextField(key: UniqueKey(),style: TextStyle(color:Colors.black,fontFamily: "Gloria Hallelujah"),cursorColor: Colors.blueGrey[900],
                        onChanged: (v){st=v;
                        if (editNoteHeading != "") {
                                       noteHeading.add(editNoteHeading);
                                        noteDescription.add(editNoteDescription);
                                      }},),
                         
                                     
                     
                    ]
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
      backgroundColor: Colors.blueGrey[900],
      context: context,
      isScrollControlled: true,
      
      elevation: 50,
      isDismissible: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (BuildContext bc) {
        return Padding(
          padding: EdgeInsets.only(left: 25, right: 25),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: (MediaQuery.of(context).size.height),
                ),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 250, top: 50),
                  child: new Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Create Your Note",
                            style: TextStyle(
                              fontSize: 20.00,
                              fontWeight: FontWeight.w500,
                              color: Colors.blueGrey[50]
                            ),
                          ),
                          
                          GestureDetector(
                            
                            onTap: () {
                              if (_formKey.currentState.validate()) {
                                setState(() {
                                  noteHeading.add(noteHeadingController.text);
                                  noteDescription
                                      .add(noteDescriptionController.text);
                                  noteHeadingController.clear();
                                  noteDescriptionController.clear();
                                });
                                Navigator.pop(context);
                              }
                              //print(noteHeadingController.text);
                              //print(noteDescriptionController.text);
                            },
                            child: Container(
                              child: Row(
                                children: [
                                  Text(
                                    "Save",
                                    style: TextStyle(
                                      fontSize: 20.00,
                                      color: Colors.blueGrey[50],
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.blueGrey[50],
                        thickness: 2.5,
                      ),
                      TextFormField(
                        maxLength: notesHeaderMaxLenth,
                        controller: noteHeadingController,
                        decoration: InputDecoration(
                          hintText: "Note Heading",
                          hintStyle: TextStyle(
                            fontSize: 15.00,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                          prefixIcon: Icon(Icons.text_fields_outlined),
                        ),
                        style: TextStyle(color:Colors.white),
                        validator: (String noteHeading) {
                          if (noteHeading.isEmpty) {
                            return "Please enter Note Heading";
                          } else if (noteHeading.startsWith(" ")) {
                            return "Please avoid whitespaces";
                          }
                        },
                        onFieldSubmitted: (String value) {
                          FocusScope.of(context)
                              .requestFocus(textSecondFocusNode);
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Container(
                          margin: EdgeInsets.all(1),
                          height: 5 * 60.0,
                          child: TextFormField(
                            
                            focusNode: textSecondFocusNode,
                            maxLines: notesDescriptionMaxLines,
                            maxLength: notesDescriptionMaxLenth,
                            controller: noteDescriptionController,
                            decoration: InputDecoration(
                              focusColor: Colors.blueGrey[50],
                              border: OutlineInputBorder(),
                              hintText: 'Description',
                              hintStyle: TextStyle(
                                fontSize: 15.00,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                              
                              ),

                            ),
                            style: TextStyle(color:Colors.blueGrey[50]),
                            validator: (String noteDescription) {
                              if (noteDescription.isEmpty) {
                                return ("Please enter Note Desc");
                              }
                               else if (noteDescription.startsWith(" ")) {
                                return ("Please avoid whitespaces");
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget notesHeader() {
  return Padding(
    padding: const EdgeInsets.only(
      top: 10,
      left: 2.5,
      right: 2.5,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Note Taker",
          style: TextStyle(
            color: Colors.blueGrey[50],
            fontSize: 45.00,
            fontWeight: FontWeight.w500,
            fontFamily: 'Monoton',
          ),
        ),
      ],
    ),
  );
}
