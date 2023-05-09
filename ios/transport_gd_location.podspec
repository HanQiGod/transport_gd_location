#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint transport_gd_location.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'transport_gd_location'
  s.version          = '0.0.1'
  s.summary          = '基于 Flutter 封装的网络货运信息交互系统位置信息上传插件(基于高德地图，iOS和Android)'
  s.description      = <<-DESC
基于 Flutter 封装的网络货运信息交互系统位置信息上传插件(基于高德地图，iOS和Android)
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  # 指定文件位置
  s.ios.vendored_frameworks = 'Frameworks/MapManager.framework'
  s.preserve_path = 'Frameworks/*'
  s.dependency 'Flutter'
  s.platform = :ios, '9.0'
  s.static_framework = true

  # 地图相关
  s.dependency 'AMapLocation'
  s.dependency 'AMapSearch'
  # GMObjC 国密算法 SDK
  s.dependency 'GMObjC'
  # 数据转模型
  s.dependency 'MJExtension'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
end
