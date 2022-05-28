import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionStatusWidget extends StatefulWidget {
  const PermissionStatusWidget({Key key}) : super(key: key);

  @override
  _PermissionStatusState createState() => _PermissionStatusState();
}

class _PermissionStatusState extends State<PermissionStatusWidget> {

  Future<void> _checkPermissions() async {
    var status = await Permission.location.status;
    if (status.isGranted) {
      Navigator.pushReplacementNamed(context, '/loading');
    }
    else if (status.isDenied) {
      // We didn't ask for permission yet or the permission has been denied before but not permanently.
      if (await Permission.location.request().isGranted) {
        // Either the permission was already granted before or the user just granted it.
        Navigator.pushReplacementNamed(context, '/loading');
      }
    }
  }

  void requestPermissionWithOpenSettings() async {
    openAppSettings();
  }

  void route() async{
    await _checkPermissions();

  }

  @override
  void initState() {
    super.initState();
    route();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text('It seems that you have denied the location permission.\n'
                'Please enable it manually by:-\n'
                'Step1 - Open Settings\n'
                'Step2 - Go to App Management\n'
                'Step3 - Go to Weather App SV and then Permissions\n'
                'Step4 - Enable Location Permission\n'
                'Step5 - Run the app again\n',
            style: TextStyle(
              fontSize: 17,
            ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Text('Click The below Button to go directly to the App settings:-',
            style: TextStyle(
              fontSize: 20,
            ),),
          ),
          Center(
            child: ElevatedButton(
              child: Text('Open App Settings'),
              onPressed: requestPermissionWithOpenSettings,
            ),)
        ],
      )

    );
  }
}
