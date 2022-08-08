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
```
█████████████████████████████████
█████████████████████████████████
████ ▄▄▄▄▄ █▄ ▀█▄ ▀█▄█ ▄▄▄▄▄ ████
████ █   █ ██▄ ▄█  ▀▀█ █   █ ████
████ █▄▄▄█ ██▀█▀▄█▀███ █▄▄▄█ ████
████▄▄▄▄▄▄▄█ ▀▄█ ▀▄█▄█▄▄▄▄▄▄▄████
████ ▄█  ▀▄█▀▄▀▀▀▀█ ▀▀▄█▀▀▀▀▄████
████▀█▀▀▄█▄▀█▄█ ▀▄▄ █ ▄▄  ▀▀ ████
████ █▀   ▄ ▄   ▀▀▄▀▄▄▄▀▀██▀▄████
████ ▄ █▀▀▄▀ ▀▄▀█▄▄▄ ▄██▀▄ ▄ ████
████▄█▄▄█▄▄▄ ▀██ ▄ ▀ ▄▄▄ █▄ █████
████ ▄▄▄▄▄ ██▄▀ ▄ ██ █▄█ ▄██▄████
████ █   █ █ █▄▀▀██▄▄▄  ▄ █ ▀████
████ █▄▄▄█ █▀█▀▄██▄▀█▀▀▀ █   ████
████▄▄▄▄▄▄▄█▄██▄██▄▄▄█▄██▄██▄████
█████████████████████████████████
█████████████████████████████████
```
