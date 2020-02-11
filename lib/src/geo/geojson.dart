library mapboxgl.geo.geojson;

import 'package:js/js_util.dart';
import 'package:mapbox_gl_dart/src/interop/interop.dart';
import 'package:mapbox_gl_dart/src/utils.dart';

class FeatureCollection extends JsObjectWrapper<FeatureCollectionJsImpl> {
  String get type => jsObject.type;
  List<Feature> get features =>
      jsObject.features.map((dynamic f) => Feature.fromJsObject(f));

  factory FeatureCollection({
    List<Feature> features,
  }) {
    return FeatureCollection.fromJsObject(FeatureCollectionJsImpl(
      type: 'FeatureCollection',
      features: features.map((dynamic f) => f.jsObject).toList(),
    ));
  }

  /// Creates a new FeatureCollection from a [jsObject].
  FeatureCollection.fromJsObject(FeatureCollectionJsImpl jsObject)
      : super.fromJsObject(jsObject);
}

class Feature extends JsObjectWrapper<FeatureJsImpl> {
  num get id => jsObject.id;
  String get type => jsObject.type;
  Geometry get geometry => Geometry.fromJsObject(jsObject.geometry);
  Map<String, dynamic> get properties => dartifyMap(jsObject.properties);
  String get source => jsObject.source;

  factory Feature({
    Geometry geometry,
    Map<String, dynamic> properties,
    String source,
  }) =>
      Feature.fromJsObject(FeatureJsImpl(
        type: 'Feature',
        geometry: geometry.jsObject,
        properties: jsify(properties),
        source: source,
      ));

  /// Creates a new Feature from a [jsObject].
  Feature.fromJsObject(FeatureJsImpl jsObject) : super.fromJsObject(jsObject);
}

class Geometry extends JsObjectWrapper<GeometryJsImpl> {
  String get type => jsObject.type;
  dynamic get coordinates => jsObject.coordinates;

  factory Geometry({
    String type,
    dynamic coordinates,
  }) =>
      Geometry.fromJsObject(GeometryJsImpl(
        type: type,
        coordinates: coordinates,
      ));

  /// Creates a new Geometry from a [jsObject].
  Geometry.fromJsObject(GeometryJsImpl jsObject) : super.fromJsObject(jsObject);
}
