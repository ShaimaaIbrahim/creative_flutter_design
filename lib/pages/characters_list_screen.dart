import 'package:creative_design/models/characters.dart';
import 'package:creative_design/styleGuide.dart';
import 'package:flutter/material.dart';
import 'package:creative_design/widgets/character_widget.dart';

class CharacterListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CharacterListScreenState();
  }
}

class _CharacterListScreenState extends State<CharacterListScreen> {

  PageController pageController;
  int currentPage =0;

  @override
  void initState() {
    super.initState();

    pageController = PageController(
      viewportFraction: 1.0,
      initialPage: currentPage,
      keepPage: false
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Icon(Icons.search),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: SafeArea(
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Padding(
                padding: const EdgeInsets.only(left: 32 , top: 8),
                child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text : "Animal Kingdom", style: AppTheme.display1),
                        TextSpan(text : "\n"),
                        TextSpan(text : "Characters", style: AppTheme.display1)
                      ],
                    )),
              ),
              Expanded(
                child: PageView(

                  physics: ClampingScrollPhysics(),
                  controller: pageController,
                    children: [
                      for(var i =0 ; i< characters.length; i++)
                      CharacterWidget(characters[i] , pageController , currentPage),
                    ],
                ),
              )
            ],

          ),
        ),
      )

    );
  }
}
