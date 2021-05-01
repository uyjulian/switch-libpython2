# Python 2.7.18 port to Nintendo Switch

This repository contains a Python 2.7.18 port to Nintendo Switch.

# Building

These steps are done on a Ubuntu 18.04 based image.  
Clone the repository.  
```bash
git clone https://github.com/uyjulian/switch-libpython2.git
```
Change directory to inside the repository.
```bash
cd switch-libpython2
```
Install prerequisites.
```bash
sudo bash setup.bash
```
Set up the docker environment.
```bash
sudo bash setup-docker.bash
```
Download and extract CPython 2.7.18.
```bash
bash extract.bash
```
Configure, build, and archive prefix.
```bash
sudo bash build-switch-docker.bash
```
Package the stdlib into a zip file.
```bash
bash package-stdlib.bash
```
The resulting files are:  
* `python27.zip` - The python stdlib  
* `python27-switch.tar.gz` - The built Python prefix

# License

This repository is licensed under PSF license v2. For more information, see `LICENSE` file.
