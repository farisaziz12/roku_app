# roku_app

# Description:

A small Roku Channel to play around with and learn Brightscript

# Getting Started:

```bash
node RokuDeploy.js
```

This will deploy the channel to your roku.

Notes: 
- Remember to create `.env` file with the `ROKU_IP` and `ROKU_PASSWORD` variables from your device.
- For login authentication to work `Node` server needs to be running on `http://192.168.1.126:5500` with a `login.json` file.
It needs to emit a JSON object like this:
```bash
{
  "status": "verified"
}

```
