## Latest changes and summary of what has been done.

##### Wednesday 22 April 2026

### New

- New script to see updates avaliable on the polybar module. [KaliUpdates.sh](https://github.com/Usergh0st/Machinepwn/blob/master/home/.config/bspwm/src/KaliUpdates.sh)
    - [commit](https://github.com/Usergh0st/Machinepwn/commit/a40b470e6ccae05943af66f6be18f9e04804c836)
- New config of picom transparency now you have transparency windows on terminal, polybar, (etc)
    - [commit](https://github.com/Usergh0st/Machinepwn/commit/bc489af43a8047427a727a85025bea16aaaf7cab)

### Changes

- Code refactoring and cleaning
- Some changes in the polybar homebar and BarPwn
- Fix zcompdump error paths
- Fixed some error in script. [KaliUpdates.sh](https://github.com/Usergh0st/Machinepwn/blob/master/home/.config/bspwm/src/KaliUpdates.sh)
- Some bug fixes and refactoring

### Previews

Here's a preview of how the environment is coming along, there are still many things missing. But they will be added little by little.

- <img width="1920" height="1080" alt="Image" src="https://github.com/user-attachments/assets/2a68a996-5406-4f38-9e13-3a0aae08bc1f" />

Update module; with this you can see how many packages you need to update.

- <img width="40" height="28" alt="Image" src="https://github.com/user-attachments/assets/d55166b5-4ac4-44f0-bb5f-677942adfbd3" />

### To-Do

- Create local configuration with mpv and ncmpcpp.
- Configure the Dunst notification daemon.
- Create the installer for Arch-based distributions.
- Improve and optimize the environment to be faster.
- Explore some ideas and see which function to implement.
- Configure gtk-3.0 and gtk-4.0 themes and cursors.

---

## Annual update, improving the environment, adding features.

##### Sunday 11 January 2026

### New

- New script to configure screen monitor. [MonitorSetup.sh](https://github.com/Usergh0st/Machinepwn/blob/master/home/.config/bspwm/src/MonitorSetup.sh)
- New script to configure custom monitor resolution. [CustomResolution.sh](https://github.com/Usergh0st/Machinepwn/blob/master/home/.config/bspwm/src/CustomResolution.sh)
- New script to install this environment. [KaliInstaller.sh](https://github.com/Usergh0st/Machinepwn/blob/master/KaliInstaller.sh)
- New script to select a ramdon wallpapers. [WallSelect.sh](https://github.com/Usergh0st/Machinepwn/blob/master/home/.config/bspwm/src/WallSelect.sh)
- New fonts added, for powerlevel10k, polybar. (etc...)
    - [commit](https://github.com/Usergh0st/Machinepwn/commit/4ad3519f59c5494c6625639ed273c960fd30e350)
- New added (.zshrc) powerlevel10k theme, and more things.
    - [commit](https://github.com/Usergh0st/Machinepwn/commit/1d417e9216c09a86953c85b4a94710aa3672d911)
    - [commit](https://github.com/Usergh0st/Machinepwn/commit/6986203675c4979965995184d8ac23d37015100b)
    - [commit](https://github.com/Usergh0st/Machinepwn/commit/747cf0fdea2725e498f46921484dc4c0bb9e948c)
- New polybar homebar, another polybar to avoid doing penetration testing.
    - [commit](https://github.com/Usergh0st/Machinepwn/commit/96458883742ff63f383015046593b3828084a298)

### Changes

- The (target.sh) script was corrected, it's does not update because of the empty string.
    - module spaces were ordered in the polybar.
    - [commit](https://github.com/Usergh0st/Machinepwn/commit/e754bd2c813abff99d193432837e2b4f2b7f607a)
- Remove (.gitignore) and (pkgs.md) unnecessary files.
    - [commit](https://github.com/Usergh0st/Machinepwn/commit/10545825f80903ea705840e6368933e5d34138b1)
- Remove (previews) directory unnecessary.
    - [commit](https://github.com/Usergh0st/Machinepwn/commit/77f832c14ba2df540a7a247d0e12ef2eb76d58cf)
- Some files in (src) were edited, but one file was renamed.
    - [commit](https://github.com/Usergh0st/Machinepwn/commit/1e6407045ad7fbef800f584f942c5bea8c561410)
- Minor changes to some files, the installer was improved (KaliInstaller.sh)
- Some icons in the polybar were changed, and some things were edited.

### Previews

Preview of how the polybar turned out; I created two configurations, one for pentesting and one normal.

> Pentesting bar

- <img width="1919" height="28" alt="pentesting_bar" src="https://github.com/user-attachments/assets/38781fb8-195a-4605-986d-d039d62c6f85" />
- <img width="1920" height="28" alt="pentesting_bar" src="https://github.com/user-attachments/assets/051558c7-d147-4e97-b89d-addf3d0d1e5c" />

> Normal bar

- <img width="1920" height="28" alt="normal_bar" src="https://github.com/user-attachments/assets/1921cb25-edd7-46db-b2f1-24c9adec9d7f" />
- <img width="1919" height="28" alt="normal_bar" src="https://github.com/user-attachments/assets/a89fc65a-f605-4771-a6a8-186ddee42ee5" />

Finally, an overview of what the terminal looks like with powerlevel10k fzf and other utilities.

- ![terminal](https://github.com/user-attachments/assets/2a178198-2ef6-403a-bcb9-e9894d13c324)

### To-Do

- Configure the Picom Transparency manager.
- Create a better script for selecting wallpapers.
- Create more conceptual menus for rofi.
- Configure the bspwm external rules.

---

## Adding more things and making some changes.

##### Wednesday 17 December 2025

### New

- New configuration scripts.
- New rofi powermenu.
- New rofi launchers styles.
    - has a three styles you can choose between style-1.rasi, style-2.rasi, style-3.rasi.

### Changes

- Minor changes in some files refactor.
- Changes to the configuration files of the alacritty terminal.
    - New file (fonts.toml)
- Minor changes in the polybar refactor.
- Minor changes in the file (sxhkdrc) new shortcuts.
- The folder structure was changed.

### Preview

The following will show how the pitching styles and other things turned out.

- <img width="1920" height="1080" alt="powermenu" src="https://github.com/user-attachments/assets/1c326e29-1350-4676-aaa7-f6b12ff9a844" />

The power menu lets you perform these actions quickly.

- <img width="1920" height="1080" alt="launcherstyle2" src="https://github.com/user-attachments/assets/65d8f58c-81d1-43e5-aacf-d739b6cba32b" />

New style 2 application launcher.

- <img width="1920" height="1080" alt="launcherstyle3" src="https://github.com/user-attachments/assets/2f0e018a-0e37-4ddf-adbf-659d5fd0bf74" />

New style 3 application launcher.

- <img width="1920" height="1080" alt="finallook" src="https://github.com/user-attachments/assets/cdb51b78-d11c-405e-b0c6-64042ff9b328" />

Finally, a final look at how it's coming along; better things are coming.

### To-Do

- Create rofi powermenu applet and others.
- Configure the Picom Transparency manager.
- Create script for the updates module polybar.
- Create script for wallpapers selector.

---

## Some changes and a change of topics, new color palette.

##### Thursday 26 October 2025

### New

- New rofi launcher applet.
- Work has started on the installer script for Kali Linux.
- New red color palette added with new wallpaper.
- Added VPN module for Polybar BarPwn.

### Changes

- The color palette of the alacritty terminal has been changed.
- The color palette of the polybar has been changed.
- Changes between the spaces of each module of polybar.
- Changes to the file that launches the polybar BarPwn.
- The bspwmrc file has been reconfigured.
- The sxhkdrc file has been reconfigured.
- Minor changes in some files.

### Preview

A preview of how the desktop environment is looking.

- <img width="1920" height="1080" alt="preview" src="https://github.com/user-attachments/assets/1221b07a-9fee-4db7-9506-2fc5622072d4" />

New rofi launcher apps.

- <img width="758" height="411" alt="newlauncher" src="https://github.com/user-attachments/assets/a9b4bce4-a219-4999-9725-0598ec4fbc92" />

### To-Do

- Create rofi powermenu applet and others. 
- Configure the Picom Transparency manager.
- Create script for the updates module polybar.
- Create script for wallpapers selector.

---

## Start of the Machinepwn project, forming the desktop environment.

##### Tuesday 07 October 2025

### New

- Updated the alacritty terminal configuration.
- The polybar was updated, new modules were added and it was completed.

### Changes

- The alacritty configuration was changed.
- Some files were minorly edited.

### Preview

A preview of how the desktop environment is looking

- <img width="1920" height="1080" alt="environment" src="https://github.com/user-attachments/assets/37ac8a9a-4cbb-4c9f-80cb-daa4c1079703" />

### To-Do

- Reconfigure the bspwmrc file.
- Reconfigure the sxhkdrc file.
- Add rofis menus for the polybar and others.
- Configure the Picom Transparency manager.
- Create script for the updates module polybar.
- Create script for wallpapers selector.
