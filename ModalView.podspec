Pod::Spec.new do |s|
  s.name             = 'ModalView'
  s.version          = '0.1.1'
  s.summary          = 'An easy to implement iOS Modal'
 
  s.description      = <<-DESC
This is an easy to implement and use iOS Modal
                       DESC
 
  s.homepage         = 'https://github.com/joegesualdo/ModalView-ios'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Joe Gesualdo' => 'joegesualdo@gmail.com' }
  s.source           = { :git => 'https://github.com/joegesualdo/ModalView-ios.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '10.0'
  s.source_files = 'ModalView/ModalView.swift'
 
end
