import 'package:flutter/material.dart';

final List<String> noteDescription = [];
final List<String> noteHeading = [];
TextEditingController noteHeadingController =  TextEditingController();
TextEditingController noteDescriptionController =  TextEditingController();
FocusNode textSecondFocusNode =  FocusNode();

int notesHeaderMaxLenth = 25;
int notesDescriptionMaxLines = 50;
int notesDescriptionMaxLenth;
String deletedNoteHeading = "";
String deletedNoteDescription = "";
String editNoteHeading="";
String editNoteDescription="";


List<Color> noteColor = [
  
  
  //Colors.transparent,
  Colors.orange[100],
  Colors.yellow[100],
  Colors.green[100],
  Colors.red[100],
  Colors.indigo[50],
  
];
List<Color> noteMarginColor = [
  Colors.orange[300],
  Colors.yellow[300],
  Colors.green[300],
  Colors.red[300],
  Colors.indigo[300],
  
];


/*Task(this.s, this.isChecked);
  Task.fromJson(Map<String, dynamic> json)
      : s = json['s'],
        isChecked = json['isChecked'];

  Map<String, dynamic> toJson() => {
        's': s,
        'isChecked': isChecked,
      };*/