import 'package:meta/meta.dart';

class Plant{
  final String name;
  final double waterValue;

  Plant({
    @required this.name,
    @required this.waterValue,
  });

  @override
  bool operator ==(Object o) {
    if(identical(this, o)) return true;
    return o is Plant &&
    o.name == name &&
    o.waterValue == waterValue;
  }

  @override
  int get hashCode => name.hashCode ^ waterValue.hashCode;
}