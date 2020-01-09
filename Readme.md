# Python Virtual Environment Initializer

Script to intialize a virtual python environment and the needed requirements inside it.

## Getting Started

Given that there is a *python3* installation including the *venv* module, this script initializes an virtual python enviroment in a subfolder (***venv***) relative to this init script. 

Further it installs all dependencies defined in an optional file called ***requires.txt*** into that virtual python environment. This also works for an already existing venv (virtual python environment). The dependencies can be defined with a version
```
pkg-resources==0.0.0
```
or without
```
pkg-resources
```
*The later results in latest version installed.*

In addition this script, generates an additional executable script ***savedeps*** in *venv/bin/* which is available in *PATH* as long as the virtual environment is active. This *savedeps* script generates or overwrites the ***requires.txt*** (residing next to the ***init_venv.sh*** script) with the list of the modules installed in this *venv*.

It also upgrades to the latest version of [pip](https://pip.pypa.io/en/stable/) used inside the *venv*. The python package installer *pip* is used to manage the dependencies inside the *venv*.

Lastly the script activates the virtual python environment.

### Prerequisites

* *nix-like environment (tested on [bash](https://www.gnu.org/software/bash/))
    * (should probably work also on [cygwin](https://www.cygwin.com/)) 
* [Python3](https://www.python.org/)
* [Venv Module](https://docs.python.org/3/tutorial/venv.html) - Used to generate RSS Feeds

### Installing

The script needs to be called with
```
Usage: 'source init_venv.sh'
```
to propagate the environment variables etc. into the current shell. This is also checked by the script itsels so that calling the script directly results in the output of the usage notification.

The dependencies used in the venv can be saved with the call of
```
savedeps
```
#### Beware:

The script *savedeps* is only available as long as the venv is active. 

This *savedeps* script overwrites ***requires.txt*** with the list of the modules currently installed in this *venv*.

## Contributing

If you like to contribute some improvement you are highly welcome to send a pull request.

## Versioning

0.1.0 - initial version

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/delight/python_init_venv/tags). 

## Authors

* **Konstantnos Kostarellis** - *Initial work* - [Github](https://github.com/delight)

See also the list of [contributors](https://github.com/delight/python_init_venv/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details

#### From venv documentation [:link:](https://docs.python.org/3/library/venv.html#venv-def):

A virtual environment is a Python environment such that the Python interpreter, libraries and scripts installed into it are isolated from those installed in other virtual environments, and (by default) any libraries installed in a “system” Python, i.e., one which is installed as part of your operating system.

A virtual environment is a directory tree which contains Python executable files and other files which indicate that it is a virtual environment.

Common installation tools such as setuptools and pip work as expected with virtual environments. In other words, when a virtual environment is active, they install Python packages into the virtual environment without needing to be told to do so explicitly.

When a virtual environment is active (i.e., the virtual environment’s Python interpreter is running), the attributes sys.prefix and sys.exec_prefix point to the base directory of the virtual environment, whereas sys.base_prefix and sys.base_exec_prefix point to the non-virtual environment Python installation which was used to create the virtual environment. If a virtual environment is not active, then sys.prefix is the same as sys.base_prefix and sys.exec_prefix is the same as sys.base_exec_prefix (they all point to a non-virtual environment Python installation).

When a virtual environment is active, any options that change the installation path will be ignored from all distutils configuration files to prevent projects being inadvertently installed outside of the virtual environment.

When working in a command shell, users can make a virtual environment active by running an activate script in the virtual environment’s executables directory (the precise filename and command to use the file is shell-dependent), which prepends the virtual environment’s directory for executables to the PATH environment variable for the running shell. There should be no need in other circumstances to activate a virtual environment; scripts installed into virtual environments have a “shebang” line which points to the virtual environment’s Python interpreter. This means that the script will run with that interpreter regardless of the value of PATH. On Windows, “shebang” line processing is supported if you have the Python Launcher for Windows installed (this was added to Python in 3.3 - see PEP 397 for more details). Thus, double-clicking an installed script in a Windows Explorer window should run the script with the correct interpreter without there needing to be any reference to its virtual environment in PATH.

