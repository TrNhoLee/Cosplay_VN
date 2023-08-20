import 'package:flutter/material.dart';

class AccountInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _createRepresentativeImage(),
        SizedBox(height: 10),
        _createInfo()
      ],
    );
  }

  _createRepresentativeImage() {
    return Stack(
        // fit: StackFit.expand,
        alignment: Alignment.topCenter,
        children: [_createBackground(), _createAvatar()]);
  }

  _createBackground() {
    return Stack(
      children: [
        InkWell(
            onTap: _changeBackground,
            child: Container(
              height: 300,
              width: double.infinity,
              child: FlutterLogo(),
            )),
        Container(
          alignment: Alignment.bottomRight,
          width: double.infinity,
          height: 300,
          child: Container(
            width: 50,
            height: 50,
            child: OutlinedButton(
              child: Icon(Icons.camera_alt, color: Colors.black, size: 20),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25))),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white)),
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }

  _createAvatar() {
    return Container(
      margin: EdgeInsets.only(top: 200),
      child: InkWell(
          child: Container(
            width: 150,
            height: 150,
            margin: const EdgeInsets.all(15),
            child: Stack(
              children: [
                FlutterLogo(size: 150),
                Container(
                  alignment: Alignment.bottomRight,
                  width: double.infinity,
                  height: 150,
                  child: Container(
                    width: 50,
                    height: 50,
                    child: OutlinedButton(
                      child:
                          Icon(Icons.camera_alt, color: Colors.black, size: 20),
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25))),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white)),
                      onPressed: () {},
                    ),
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all(color: Colors.white, width: 5),
                borderRadius: BorderRadius.circular(100)),
          ),
          onTap: _changeAvatar),
    );
  }

  _createInfo() {
    return Column(
      children: [
        ListTile(
          leading: SizedBox(width: 50),
          title: Center(
              child: Text("Nho Le",
                  style: TextStyle(color: Colors.white, fontSize: 50))),
          trailing: IconButton(
            icon: Icon(Icons.settings),
            onPressed: _settingInfo,
          ),
        ),
        SizedBox(height: 10),
        Text("@nhonhinho000111", style: TextStyle(color: Colors.white)),
        SizedBox(height: 10),
        Text("2 followers - 4 people are following",
            style: TextStyle(color: Colors.white)),
      ],
    );
  }

  void _changeAvatar() {}

  void _changeBackground() {}

  void _settingInfo() {}
}
