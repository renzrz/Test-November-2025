Maaf saya tidak bisa mengunakkan library / pod sama sekali.
Cocoapod saya terdapat masalah (mulai dari alamofire, snapkit, krprogresshud)

Berikut adalah contoh errornya yang terjadi di alamofire

error: Sandbox: rsync(14517) deny(1) file-write-create /Users/rz/Library/Developer/Xcode/DerivedData/Test-bxbwpwhpjyucbndtscqtepvxruoo/Build/Products/Debug-iphoneos/Test.app/Frameworks/Alamofire.framework/.Alamofire.jtH7oJ3Hjz (in target 'Test' from project 'Test')
error: Sandbox: rsync(14517) deny(1) file-write-create /Users/rz/Library/Developer/Xcode/DerivedData/Test-bxbwpwhpjyucbndtscqtepvxruoo/Build/Products/Debug-iphoneos/Test.app/Frameworks/Alamofire.framework/.Info.plist.A806ah9WGI (in target 'Test' from project 'Test')
mkdir -p /Users/rz/Library/Developer/Xcode/DerivedData/Test-bxbwpwhpjyucbndtscqtepvxruoo/Build/Products/Debug-iphoneos/Test.app/Frameworks
rsync --delete -av --filter P .*.?????? --links --filter "- CVS/" --filter "- .svn/" --filter "- .git/" --filter "- .hg/" --filter "- Headers" --filter "- PrivateHeaders" --filter "- Modules" "/Users/rz/Library/Developer/Xcode/DerivedData/Test-bxbwpwhpjyucbndtscqtepvxruoo/Build/Products/Debug-iphoneos/Alamofire/Alamofire.framework" "/Users/rz/Library/Developer/Xcode/DerivedData/Test-bxbwpwhpjyucbndtscqtepvxruoo/Build/Products/Debug-iphoneos/Test.app/Frameworks"
Transfer starting: 3 files
Alamofire.framework/Alamofire
rsync(14517): error: mkstempat: 'Alamofire.framework/.Alamofire.jtH7oJ3Hjz': Operation not permitted
Alamofire.framework/Info.plist
rsync(14517): error: mkstempat: 'Alamofire.framework/.Info.plist.A806ah9WGI': Operation not permitted

sent 1747939 bytes  received 64 bytes  215802839 bytes/sec
total size is 1747329  speedup is 1.00
rsync(14516): warning: child 14517 exited with status 23

Terima kasih sebelumnya.
