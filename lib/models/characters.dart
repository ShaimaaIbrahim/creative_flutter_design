import 'package:flutter/material.dart';

class Character{

  final String name ;
  final String imagePath;
  final String descriptions;
  final List<Color> colors;

  Character(this.name, this.imagePath, this.descriptions, this.colors);


}

List characters  = [

  Character("Panther" , "assets/images/hen.jpg" , "Panther is beautiful animal which is cooled in niy yamal of gho draft front end shaimaa salama salama nody is doo in great ready of me we ready ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss" , [Colors.orange , Colors.red , Colors.redAccent]),
  Character("Elephant" , "assets/images/hen.jpg" , "Panther is beautiful animal which is cooled in niy yamal of gho draft front end shaimaa salama salama nody is doo in great ready of me we ready" , [Colors.cyan , Colors.deepPurpleAccent , Colors.deepPurple]),

];