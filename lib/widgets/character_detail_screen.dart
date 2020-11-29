import 'package:after_layout/after_layout.dart';
import 'package:creative_design/models/characters.dart';
import 'package:creative_design/styleGuide.dart';
import 'package:flutter/material.dart';

class CharactersDetailScreen extends StatefulWidget {

  final Character character;
  final double expandedBottomSheet = 0;
  final double collapsedBottomSheet = -250;
  final double fullCollapsedBottomSheet = -330;

  CharactersDetailScreen(this.character);

  @override
  State<StatefulWidget> createState() {
    return _CharactersDetailScreen();
  }
}

class _CharactersDetailScreen extends State<CharactersDetailScreen> with AfterLayoutMixin<CharactersDetailScreen> {


  double _currentBottomSheet = -330;
  bool isCollapsed = false;


  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(

      body: Stack(

          fit: StackFit.expand,
          children: [
            Hero(
              tag: "background-${widget.character.name}",
              child: DecoratedBox(

              decoration: BoxDecoration(

              gradient: LinearGradient(

               colors: widget.character.colors,
               begin: Alignment.topRight,
               end: Alignment.bottomLeft
              ),
              ),
              ),
            ),
            SingleChildScrollView(

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 40,
                  ),

                  Padding(padding: EdgeInsets.only(top: 8, left: 16),
                    child:  IconButton(
                      icon: Icon(Icons.close),
                      iconSize: 40,
                      color: Colors.white.withOpacity(0.9),
                      onPressed: (){
                        Future.delayed(const Duration(milliseconds: 250) , (){
                          setState(() {
                            _currentBottomSheet = widget.fullCollapsedBottomSheet;
                          });
                        });
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Align(
                      alignment: Alignment.topRight,
                      child:
                      Hero(
                        tag: "image-${widget.character.imagePath}",
                        child: Image.asset(widget.character.imagePath ,
                          height: screenHeight * 0.45,),
                      )),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32 , vertical: 8),
                      child: Hero(
                          tag: "name-${widget.character.name}",

                                  child: Text(characters[0].name , style: AppTheme.heading,)),
                  ),
                  Padding(
                       padding: const EdgeInsets.fromLTRB(32 , 0 , 8 , 32),
                       child: Text(widget.character.descriptions , style: AppTheme.subHeading,)),

                ],
              ),
            ),
            AnimatedPositioned(
                duration: const Duration(milliseconds: 500),

                curve: Curves.decelerate,

                bottom: _currentBottomSheet , left: 0 , right: 0,

                child: InkWell(
                  onTap: (){
                setState(() {
                _currentBottomSheet == isCollapsed ? widget.expandedBottomSheet : widget.collapsedBottomSheet;
                isCollapsed = false;
                });
                  },
                  child: Container(

                   decoration: BoxDecoration(

                     color: Colors.white,
                     borderRadius: BorderRadius.only(topLeft: Radius.circular(40),
                     topRight: Radius.circular(40)),

                   ),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Container(
                         alignment: Alignment.center,
                         padding: const EdgeInsets.symmetric(horizontal: 32),
                         height: 80,
                         child: Text(
                           "Clips", style: AppTheme.subHeading.copyWith(color: Colors.black),
                         ),
                       ),
                       SingleChildScrollView(
                         scrollDirection: Axis.horizontal,
                         child: _clipsWidget(),
                       )
                     ],
                   ),
                  ),
                ))
          ],
        ),
    );
  }

  Widget _clipsWidget(){
    return Container(
     height: 250,
     margin: const EdgeInsets.symmetric(horizontal: 16),
     child: Row(
      children: [
        Column(
      children: [
        roundedContainer(Colors.redAccent),
        SizedBox(height: 20,),
        roundedContainer(Colors.greenAccent),
      ],
        ),
        SizedBox(width: 20,),
        Column(
          children: [
            roundedContainer(Colors.redAccent),
            SizedBox(height: 20,),
            roundedContainer(Colors.greenAccent),
          ],
        ),
        SizedBox(width: 20,),
        Column(
          children: [
            roundedContainer(Colors.redAccent),
            SizedBox(height: 20,),
            roundedContainer(Colors.greenAccent),
          ],
        ),
        SizedBox(width: 20,),
        Column(
          children: [
            roundedContainer(Colors.redAccent),
            SizedBox(height: 20,),
            roundedContainer(Colors.greenAccent),
          ],
        ),
        SizedBox(width: 20,),
        Column(
          children: [
            roundedContainer(Colors.redAccent),
            SizedBox(height: 20,),
            roundedContainer(Colors.greenAccent),
          ],
        ),
        SizedBox(width: 20,),
        Column(
          children: [
            roundedContainer(Colors.redAccent),
            SizedBox(height: 20,),
            roundedContainer(Colors.greenAccent),
          ],
        ),
      ],
     ),
    );
  }
  Widget roundedContainer(Color color){
   return Container(
     height: 100,
     width: 100,
     decoration: BoxDecoration(
     color: color,
     borderRadius: BorderRadius.all(Radius.circular(20)),

     ),
   );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 500) , (){
      setState(() {
        isCollapsed = true;
        _currentBottomSheet = widget.collapsedBottomSheet;

      });
    });

  }
}
