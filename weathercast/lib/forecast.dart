import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'location.dart';
import 'weather.dart';

Future<Weather> forecast() async {
  const url = 'https://data.tmd.go.th/nwpapi/v1/forecast/location/hourly/at';
  const token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImIyNzk0NDIwMDI1YjM1OGYxZGQwNjA3ZmUxYWQ0NWRlOTg5ZTE4NzZkNjA5NDYzMWI0YjQ2NzczNzNkN2ViZDQyNmI4YmE1ZTcyZDdiYWZlIn0.eyJhdWQiOiIyIiwianRpIjoiYjI3OTQ0MjAwMjViMzU4ZjFkZDA2MDdmZTFhZDQ1ZGU5ODllMTg3NmQ2MDk0NjMxYjRiNDY3NzM3M2Q3ZWJkNDI2YjhiYTVlNzJkN2JhZmUiLCJpYXQiOjE3MDc4ODIyMjgsIm5iZiI6MTcwNzg4MjIyOCwiZXhwIjoxNzM5NTA0NjI4LCJzdWIiOiIzMDA5Iiwic2NvcGVzIjpbXX0.MLH8aa3dPo8X3-y946pVmLAsz8awQKbkit-V7mNMqd_KsEAG0JzPuyz1wXKH_tDxaZOGIEIJ1Isp-ETbRbVyh1oSGY8TK1WGJTWRUD5GwrWRYOHRYiCHhB8M-o0kAI2hW-ToPgLCtyaDFPwKpQt6QchTK2I8sDu4ywDRQ8GKLkTtQlEarDrlXeyJWTkM1AasJm8-xQSP9zDMwh_BuO8T6OsUpdkAoSyhBUg8toqjQgzgiPTC7hWBn8bb-FYKCHco9MfH5DH8J4gb6DWKbhgFwmvDXjw8ZGe4vnMIWEeGJ7J4bnLSxiofXehfjx4hPhgHR4suKyK93ODRHRczN00JvOdJgPBVASRmfUMraE8MPNl0eZt61F2zq17xbABnYsZwRovsqSao4EoCKHUPPkkTy7kSZEJ_zj7pkUm4NV0GTQ-RQZgBUMg96GmILhsifcn-YalklsJWmBHHhN7PNlLt0GWgoJWndFLMRRF_y6eSk9veQ_8KLgFkTjm1tntvGH0dcwyiB4LV9sBzBJjSCgvaw6H-n6qhuW_jl_QEgOFS51mgtyW-6DpdFXc39xx_GxO9lEQuT6l9OYuG3NHiPDqHhXEZ-RSPcRLRWFtebXoVS4whXwp7IAs_dZoyOp5-EY0mjdRmOz7N0gst4GHK_5e5OwDJpKpIL5xwEdb0iQypyD0';

  try {
    Position location = await getCurrentLocation();
    http.Response response = await http.get(
        Uri.parse(
            '$url?lat=${location.latitude}&lon=${location.longitude}&fields=tc,cond'),
        headers: {
          'accept': 'application/json',
          'authorization': 'Bearer $token',
        });
    return Weather(address: response.body, temperature: 0, cond: 0);
  } catch (e) {
    return Future.error(e);
  }
}
