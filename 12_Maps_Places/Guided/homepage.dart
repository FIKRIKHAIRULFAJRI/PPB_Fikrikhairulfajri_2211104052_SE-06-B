import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Homepage extends StatefulWidget {
  const Homepage ({super.key});

  @override
  State<Homepage> createState() => _MyMapsState();
}

class _MyMapsState extends State<Homepage> {
  static final LatLng _kMapCenter = 
      LatLng(19.018255973653343, 72.84793849278007); 
  static final CameraPosition _kInitialPosition = CameraPosition( 
    target: _kMapCenter, 
    zoom: 11.0, 
  ); 

  
  @override
  Widget build(BuildContext context) {
     return Scaffold( 
      appBar: AppBar( 
        title: Text('Google Maps Demo'),
        backgroundColor: Colors.pinkAccent[400], 
      ), 
      body: GoogleMap( 
        initialCameraPosition: _kInitialPosition, 
        myLocationEnabled: true, 
      ), 
    ); 
  }
}