<p align="center">
<picture>
  <source media="(prefers-color-scheme: dark)" width="200" height="200" srcset="https://user-images.githubusercontent.com/28815699/193655408-3c6a5cc9-e17a-4258-b55a-e93317f4c677.png">
  <source media="(prefers-color-scheme: light)" width="200" height="200" srcset="https://user-images.githubusercontent.com/28815699/193655454-8ae23124-2f74-463f-96e7-4478307729d2.png">
  <img alt="Fshare Logo" width="200" height="200" src="https://user-images.githubusercontent.com/28815699/193656181-cb6924f6-7370-4b01-ac15-662d7bc914f3.jpg">
</picture>
</p>



A simple file sharing command line app that give you the ability to share files between your local network devices 

# Install
`dart pub global activate fshare`

# Use
If you have [modified your PATH](https://dart.dev/tools/pub/cmd/pub-global#running-a-script-from-your-path)
 , you can run this server from any local directory.

`fshare [FILEPATH]`

Otherwise you can use the dart pub global command.

`dart pub global run fshare [FILEPATH]`

# Example:
Simply run it from your cmd like this

`fshare text.txt`

then the app will run a **localserver** with random `port` and `path` ex: `http://192.168.1.15:4987/58288`, then you can use that link to transfer your file.

Or simply scan the printed Qr Code using you favorite qr scanner (most of new mobile phones has built in qr scanner in the default camera app) and transfer you file.
  
![final](https://user-images.githubusercontent.com/28815699/191107281-20ec4e86-03a5-4223-aed0-1267251c0008.gif)
