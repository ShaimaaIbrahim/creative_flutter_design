import 'package:creative_design/styleGuide.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:creative_design/models/characters.dart';
import 'package:creative_design/widgets/character_detail_screen.dart';

class CharacterWidget extends StatelessWidget{

  final Character character;
  final PageController pageController;
  final int currentPage ;


  CharacterWidget(this.character, this.pageController, this.currentPage);

  @override
  Widget build(BuildContext context) {

  final screenHeight = MediaQuery.of(context).size.height;
  final screenWidth = MediaQuery.of(context).size.width;

  return InkWell(

    onTap: (){

    Navigator.push(context, PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 350),
      pageBuilder:(context , _ , __) => CharactersDetailScreen(character),
    ));
    }
    ,
    child: AnimatedBuilder(

        animation: pageController,

        builder: (context , child) {
        double value = 1;

        if(pageController.position.haveDimensions) {
          value = pageController.page - currentPage;
          value = (1 - (value.abs() * 0.6)).clamp(0.0, 1.0);
        }

        return Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              //create customViews in flutter
              child: ClipPath(
                  clipper: CharacterCardBackgroundClipper(),
                  child: Hero(
                    tag: "background-${character.name}",
                    child: Container(
                      height: 0.6 * screenHeight,
                      width: 0.9 * screenWidth,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: character.colors,
                            begin: Alignment.topRight,
                            end: Alignment.topLeft
                        ),
                      ),
                    ),
                  )
              ),
            ),
            Align(
              alignment: Alignment(0 , -0.5),
              child: Hero(
                tag: "image-${character.imagePath}",
                child: Image.asset(
                  characters[0].imagePath,
                  height: screenHeight * 0.55 ,
                  width: 300,),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 48 , right: 16 , bottom: 16),
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Hero(
                      tag: "name-${character.name}",
                      child: Text(characters[0].name , style: AppTheme.heading,)),

                  Text("Tab To Read More" , style: AppTheme.subHeading,),

                ],
              ),
            ),
          ],
        );
      },
    ),
  );}
}

//to create custom view
class CharacterCardBackgroundClipper extends CustomClipper<Path>{

  @override
  Path getClip(Size size) {

    Path path = Path();
    double curveDistance =40;

    path.moveTo(0, size.height*0.4);
    path.lineTo(0, size.height - curveDistance);
    path.quadraticBezierTo(1, size.height-1, 0+curveDistance, size.height);
    path.lineTo(size.width-curveDistance, size.height);
    path.quadraticBezierTo(size.width+1, size.height-1, size.width, size.height-curveDistance);
    path.lineTo(size.width, 0 + curveDistance);
    path.quadraticBezierTo(size.width-1, 0, size.width-curveDistance-5, 0+curveDistance/3);
    path.lineTo(curveDistance, size.height*0.29);
    path.quadraticBezierTo(1, (size.height*0.30) + 10, 0, size.height*0.4);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
   return true;
  }

}