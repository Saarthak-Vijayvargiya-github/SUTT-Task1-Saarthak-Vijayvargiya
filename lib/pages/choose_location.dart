import 'package:flutter/material.dart';
import 'package:weather_app3/services/weather_service.dart';

class ChooseLocation extends StatefulWidget {

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  Map statusdata = {};
  var themeColor;
  var bgImage;
  final _cityTextController = TextEditingController();
  final _dataService = DataService();

  void updateSearch() async {
    final response = await _dataService.getWeather(_cityTextController.text);
    // print(response.cityName);
    // print(response.tempInfo.currTemp);
    // print(response.tempInfo.feelslike);
    // print(response.tempInfo.tempmax);
    // print(response.tempInfo.tempmin);
    // print(response.weatherInfo.description);
    // print(response.weatherInfo.icon);

      Navigator.pop(context, {
        'cityName': response.cityName,
        'currTemp': response.tempInfo.currTemp,
        'feelslike': response.tempInfo.feelslike,
        'tempmax': response.tempInfo.tempmax,
        'tempmin': response.tempInfo.tempmin,
        'pressure': response.tempInfo.pressure,
        'humidity': response.tempInfo.humidity,
        'description': response.weatherInfo.description,
        'icon': response.weatherInfo.icon,
      });

  }
  @override
  Widget build(BuildContext context) {
    statusdata = ModalRoute.of(context).settings.arguments;
    if(statusdata['status'] == 'd'){
      themeColor = Colors.indigo;
      bgImage = 'afternoon.jpg';
    }
    else{
      themeColor = Colors.lightBlueAccent;
      bgImage = 'night.jpg';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Location'),
        centerTitle: true,
        backgroundColor: themeColor,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/${bgImage}'),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: TextField(
                  textCapitalization: TextCapitalization.sentences,
                  style: TextStyle(
                    color: themeColor,
                  ),
                  controller: _cityTextController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                    ),
                    hintText: 'Enter a city',
                    hintStyle: TextStyle(
                      color: themeColor,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              MaterialButton(
                  onPressed: () {
                    if(_cityTextController.text != null) {
                      updateSearch();
                    }
                    // else{
                    //   showDialog(
                    //     context: context,
                    //     builder: (BuildContext context) => AlertDialog(
                    //       content: Text('Please enter a city'),
                    //       actions: [
                    //         TextButton(onPressed: () => Navigator.pop(context, 'Okay'),
                    //           child: Text('Okay'),
                    //         )
                    //       ],
                    //     ),
                    //   );
                    // }
              },
                  color: themeColor,
                  splashColor: Colors.yellowAccent,
                  child: Text('Get Weather'))
            ],
          ),
        ),
      ),
    );

  }

}
