# lightos
an easy setup proot [Termux](https://github.com/termux/termux-app) distro

# requirements
- internet connection (~1-5GB of data will be used depending on distro choice )
- Termux:X11 (if you plan to use a graphical enviornment) 
- Termux:API
# install
```bash
pkg install -y git gum && git clone --depth=1 https://github.com/gl1tch638/lightos.git && cd lightos/.lightos && chmod +x setup.sh && ./setup.sh
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
- https://github.com/adi1090x/termux-style
