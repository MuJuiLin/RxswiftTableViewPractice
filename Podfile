platform :ios, '10.0'
use_frameworks!
def main_sources
#define your pod resources
pod 'Alamofire'
pod 'RxAlamofire'
pod 'RxNuke'
pod 'RxDataSources', '~> 3.0'
pod 'RxSwift',    '~> 4.0'
pod 'RxCocoa',    '~> 4.0'
pod 'SlackKit'
pod 'Swifter', '~> 1.4.5'
end
def test_sources
#define your pod resources for unit test
pod 'RxBlocking', '~> 4.0'
pod 'RxTest',     '~> 4.0'
end
target 'RxSwiftTableDemo' do
main_sources

  target 'RxSwiftTableDemoTests' do
    inherit! :search_paths
    test_sources
  end

  target 'RxSwiftTableDemoUITests' do
    inherit! :search_paths
    test_sources
  end

end
