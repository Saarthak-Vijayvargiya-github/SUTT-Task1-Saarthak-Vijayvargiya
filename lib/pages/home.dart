import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {

    try{
      data = data.isNotEmpty ? data : ModalRoute
          .of(context)
          .settings
          .arguments as Map;
    }
    catch(e){
      data = {};
    }

    var iconValue = data['icon'].substring(2,3);
    print(iconValue);
    var bgImage;
    var textColor;
    var imgColor;
    var dotColor;
    if(data['icon'] == '01n'){
      imgColor = Colors.white;
    }
    else if(data['icon'] == '13n'){
      imgColor = Colors.white;
    }
    else if(data['icon'] == '50n'){
      imgColor = Colors.white;
    }
    if(iconValue == 'd'){
      bgImage = 'assets/lightblue.jpg';
      textColor = Colors.indigo[900];
      dotColor = Colors.grey;
    }
    else{
      bgImage = 'assets/darkblue.jpg';
      textColor = Colors.white;
      dotColor = Colors.grey[800];
    }

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          splashColor: Colors.yellow,
          onPressed: () async{
            dynamic result = await Navigator.pushNamed(context, '/location', arguments: {
              'status': iconValue,
            });
            setState(() {
              data ={
                'cityName': result['cityName'],
                'currTemp': result['currTemp'],
                'feelslike': result['feelslike'],
                'tempmax': result['tempmax'],
                'tempmin': result['tempmin'],
                'pressure': result['pressure'],
                'humidity': result['humidity'],
                'description': result['description'],
                'icon': result['icon'],

              };
            });
          },
          icon: Icon(Icons.search,
          color: textColor,
          size: 30.0,),
        ),
        actions: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 20, 0),
            child: GestureDetector(
              onTap: () {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    content: Text('To be updated'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Okay!'),
                        child: Text('Okay!'),
                      ),
                    ],
                  ),
                );
              },
              child: SvgPicture.asset('assets/menu.svg',
                height: 30.0,
                width: 30.0,
                color: textColor,
              ),
            ),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(bgImage),
              fit: BoxFit.cover,
            )
        ),
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${data['description']}',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: textColor,
                  ),
                ),

                Image.network(
                    'https://openweathermap.org/img/wn/${data['icon']}@2x.png',
                    scale: 0.1,
                  color: imgColor,
                  ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('${data['cityName']}',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: textColor,
                          ),
                        ),

                        Text('${data['currTemp']}°',
                          style: TextStyle(
                            color: textColor,
                            fontSize: 50,
                          ),),
                        Text('feels like ${data['feelslike']}°',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: textColor,
                          ),)
                      ],
                    ),
                    Column(
                      children: [
                        // Text('Max',
                        //   style: TextStyle(
                        //     color: Colors.white,
                        //     fontSize: 15.0,
                        //   ),),
                        Text('Pressure:',
                          style: TextStyle(
                            color: textColor,
                            fontSize: 15.0,
                          ),),
                        Text('${data['pressure']} Pa',
                          style: TextStyle(
                            color: textColor,
                            fontSize: 20.0,
                          ),),
                      ],
                    ),
                    Column(
                      children: [
                        // Text('Min',
                        //   style: TextStyle(
                        //     color: Colors.white,
                        //     fontSize: 15.0,
                        //   ),),
                        Text('Humidity:',
                          style: TextStyle(
                            color: textColor,
                            fontSize: 15.0,
                          ),),
                        Text('${data['humidity']}',
                          style: TextStyle(
                            color: textColor,
                            fontSize: 20.0,
                          ),),
                      ],
                    ),
                  ],
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                          color: textColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                      ),
                      Container(
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                          color: dotColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                      ),
                      Container(
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                          color: dotColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                      ),
                      Container(
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                          color: dotColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

          ),
        ),
      ),
    );
  }
}