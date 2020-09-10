import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test("permission check", () async {
    Position position = await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    expect("see result: ", position);
  });
  /*
  test("permission check", () async {
    LocationPermission locationPermission = await checkPermission();
    expect(locationPermission, false);
  }); */
}

//flutter test test/permission_test.dart