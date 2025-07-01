# qt_ui_train
training project for qt based ui


## setup on MAC
### get XQuartz
 * download from https://www.xquartz.org/
 * `xquartz -listen tcp &`
 * run the command on terminal `xhost + &`
 * ensure `DISPLAY=host.docker.internal:0` is set in teh container via the docker file or `.devcontainer.json`
     * Troubleshooting
         * `lsof -i TCP:6000` should list Xquartz as listening application
         * firewall can interfere with the setup

#### Run with X11 forwarding AND enable OpenGL fallback
In Terminal on macOS:
* `defaults write org.xquartz.X11 enable_iglx -bool true`
Then restart XQuartz, and try again.

#### Force Qt to use software OpenGL
Inside the container (or in code), set the following env variable:
* `export QT_QUICK_BACKEND=software`

#### test connectivity
* `sudo apt-get install -y x11-apps`
* `xclock`

### inside the container prompt
run build steps as
#### qt6 build steps
code to root directory of the project
* `mkdir build && cd build` 
* `cmake ..` 
* `make`
* `./your_app`








 