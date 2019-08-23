import 'dart:math' show sin;

import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong/latlong.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';

class Geolocation {
  Future<bool> hasLocationPermission() async {
    var status = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.locationWhenInUse);
    if (status == PermissionStatus.granted) {
      print('Location permission granted');
      return true;
    } else {
      print('Location permission not granted');
      return false;
    }
  }

  Future<bool> requestLocationPermission() async {
    Map statuses = await PermissionHandler()
        .requestPermissions([PermissionGroup.locationWhenInUse]);
    if (statuses[PermissionGroup.locationWhenInUse] ==
        PermissionStatus.granted) {
      return true;
    } else if (statuses[PermissionGroup.locationWhenInUse] ==
            PermissionStatus.denied ||
        statuses[PermissionGroup.locationWhenInUse] ==
            PermissionStatus.denied) {
      var opened = await PermissionHandler().openAppSettings();
      if(opened) {
        return await hasLocationPermission();
      } else {
        return false;
      }
    }
    return false;
  }

  Future<LatLng> getLocation() async {
    if (await hasLocationPermission()) {
      var locator = Geolocator()..forceAndroidLocationManager = true;
      var position = await locator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      return LatLng(position.latitude, position.longitude);
    } else {
      await requestLocationPermission();
      return await getLocation();
    }
  }

  static String locationToString(LatLng location) {
    if (location == null) {
      return "";
    }
    return "[${location.latitude}:${location.longitude}]";
  }

  static LatLng locationFromString(String location) {
    double lat, lng;
    if (location == "" || location == null) {
      return null;
    }
    String latt = location.substring(1, location.indexOf(':'));
    String longg =
        location.substring(location.indexOf(':') + 1, location.indexOf(']'));
    lat = double.parse(latt);
    lng = double.parse(longg);
    return LatLng(lat, lng);
  }

  static String polygonToString(List<LatLng> points) {
    String polyg = "";
    if (points == null) {
      return "";
    }
    for (var pt in points) {
      if (pt == points.last) {
        polyg += locationToString(pt);
        continue;
      }
      polyg += locationToString(pt) + ",";
    }
    return polyg;
  }

  static List<LatLng> polygonFromString(String polygon) {
    if (polygon == "") {
      return null;
    }
    List<String> points = polygon.split(',');
    List<LatLng> pts = [];
    for (var point in points) {
      var pt = locationFromString(point);
      if (pt != null) {
        pts.add(pt);
      }
    }
    return pts;
  }

  static LatLng getMidPoint(List<LatLng> polygon) {
    if (polygon == null) {
      return null;
    }
    double totalLat = 0, totalLng = 0;
    for (var point in polygon) {
      totalLat += point.latitude;
      totalLng += point.longitude;
    }
    return LatLng(totalLat / (polygon.length), totalLng / (polygon.length));
  }

  static LatLngBounds getBoundingBox(List<LatLng> polygon) {
    if (polygon == null) {
      print('Polygon is null. Inside getBoundingBox');
      return null;
    }
    var bounds = LatLngBounds();
    for (var point in polygon) {
      bounds.extend(point);
    }
    return bounds;
  }

  static Polygon createPolygon(List<LatLng> points, Color border, inner) {
    return Polygon(
      borderColor: border,
      borderStrokeWidth: 5,
      color: inner,
      points: points,
    );
  }

  static Marker createPointMarker(
      LatLng point, Color border, inner, double radius) {
    return Marker(
      builder: (context) {
        return Icon(Icons.add_circle);
      },
      height: radius,
      width: radius,
      point: point,
    );
  }

  static int WGS84_RADIUS = 6378137;

  static num getPolygonArea(List<LatLng> coordinates) {
    num _area = 0;
    if (coordinates.length > 2) {
      for (var i = 0; i < coordinates.length; i++) {
        var lowerIdx = 1;
        var middleIdx = i + 1;
        var upperIdx = i + 2;

        if (i == coordinates.length - 2) {
          lowerIdx = coordinates.length - 2;
          middleIdx = coordinates.length - 1;
          upperIdx = 0;
        } else if (i == coordinates.length - 1) {
          lowerIdx = coordinates.length - 1;
          middleIdx = 0;
          upperIdx = 1;
        }

        var p1 = coordinates[lowerIdx];
        var p2 = coordinates[middleIdx];
        var p3 = coordinates[upperIdx];

        // _area += (rad(p3[0]) - rad(p1[0])) * sin(rad(p2[1]));
        _area +=
            (p3.longitudeInRad - p1.longitudeInRad) * sin(p2.latitudeInRad);
      }
      _area = _area * WGS84_RADIUS * (WGS84_RADIUS / 2);
    }
    return _area.abs();
  }
}
