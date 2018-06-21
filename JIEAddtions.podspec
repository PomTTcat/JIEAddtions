#
#  Be sure to run `pod spec lint JIEAddtions.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|


  s.name         = "JIEAddtions"
  s.version      = "0.0.9"
  s.summary      = "Some Category for iOS"
  s.description  = <<-DESC
                   Some Category for iOS Desc
                   DESC

  s.homepage     = "https://github.com/PomTTcat/JIEAddtions"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }


  s.author       = { "studentBGY" => "craftsmanb6@gmail.com" }


  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/PomTTcat/JIEAddtions.git", :tag => "#{s.version}" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any swift, h, m, mm, c & cpp files.
  #  For header files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #

  # s.source_files  = "JEMainFile/**/*.{h,m}"
  s.exclude_files = "cocoDemo"

  s.subspec 'JEAddtions' do |ss|
    ss.source_files = 'JEMainFile/UI*.{h,m}'
  end

  s.subspec 'JEModel' do |ss|
    ss.source_files = 'JEMainFile/JE*.{h,m}'
  end

  s.subspec 'JEGlobal' do |ss|
    ss.source_files = 'JEMainFile/JEGlobal.{h,m}'
  end

  s.subspec 'JEHelper' do |ss|
    ss.source_files = 'JEMainFile/helper/*.{h,m}'
  end
  # s.public_header_files = "Classes/**/*.h"


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # s.framework  = "UIKit"
  s.frameworks = "UIKit", "Foundation"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  # s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
