# lightos
a termux distro
VERY EARLY STAGES!! pretty much just an arch init script rn
inspired by DARKOS: https://github.com/ahmad1abbadi/darkos
note: this is a 1 man project, updates and maintaining may be spotty
# requirements
- internet connection (~1-5GB of data will be used depending on distro choice )
- Termux:X11 (if you plan to use a graphical enviornment) 
- Termux:API
# install
```bash
git clone --depth=1 https://github.com/gl1tch638/lightos.git && cd lightos && chmod +x setup.sh && ./setup.sh
```
# todo

features (planned)
- [x] launcher
  - [x] access to termux
  - [ ] launch to x11

- [ ] installer
  - [ ] tui
  - [ ] error catching
  - [ ] package selector
  - [ ] wm selector
  - [ ] distro selector
  - [ ] inputless mode
  - [x] init user
  - [ ] box86

- [ ] theme
qol:
- [ ] convienent way to start hardware accelerated

# sources and thanks
this project couldn't be possible without these useful sources!
- https://github.com/LinuxDroidMaster/Termux-Desktops
