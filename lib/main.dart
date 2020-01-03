import 'package:destini_challenge_starting/story_brain.dart';
import 'package:flutter/material.dart';

void main() => runApp(Destini());

class Destini extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  final StoryBrain _storyBrain = new StoryBrain();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
              children:[Image.asset('images/background.png',height: size.height,width: size.width, fit: BoxFit.fill,),
                Container(
          padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
          constraints: BoxConstraints.expand(),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  flex: 12,
                  child: Center(
                    child: Text(
                      _storyBrain.getStory(),
                      style: TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: FlatButton(
                    onPressed: () {
                      //Choice 1 made by user.
                      setState(() {
                        _storyBrain.nextStory(1);
                      });
                    },
                    color: Colors.red,
                    child: Text(
                      _storyBrain.getChoice1(),
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Expanded(
                  flex: 2,
                  child: Visibility(
                    visible: _storyBrain.storyNumber == 3 ||
                        _storyBrain.storyNumber == 4 ||
                        _storyBrain.storyNumber == 5 ?
                    false : true,
                    child: FlatButton(
                      onPressed: () {
                        //Choice 2 made by user.
                        setState(() {
                          _storyBrain.nextStory(2);
                        });
                      },
                      color: Colors.blue,
                      child: Text(
                        _storyBrain.getChoice2(),
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),] 
      ),
    );
  }
}