
import 'transport_gd_location_platform_interface.dart';

class TransportGdLocation {
  Future<String?> getPlatformVersion() {
    return TransportGdLocationPlatform.instance.getPlatformVersion();
  }
}
