###### This is a new and improved version of the beloved Open Humans README that you all know and love.

***

# The OPEN Project Data Management Instructions — Open Humans V3.0

***

## GENERAL USAGE NOTES:
This is an instructional text for downloading and working with Open Humans data. Open Humans is a data repository service that OPEN is using to store NightScout, Android APS, OpenAPS and [hopefully soon] iOS looping data from DIYAPS users.
While it is recommended to read through the Data Management Plan in full to get a detailed sense of the data pipeline, management expectations and ultimate fate of the dataset, this README will provide you with enough information to confidently work with the data. Please, don't hesitate to contact Drew Cooper if any problems arise—I'm always available to help.

***

## Table of Contents:
1. [DOWNLOADING DATA](#downloading-data)
2. [CONVERTING DATA](#converting-data)
3. [VERSIONING](#versioning) 
4. [STORAGE](#storage)
5. [OPEN HUMANS DIRECT ACCESS](#open-humans-direct-access)
6. [ACCESS OH DATA AND METADATA](#access-oh-data-and-metadata) 

***
 
### DOWNLOADING DATA:
Downloading data from [Open Humans](https://www.openhumans.org/) can be done using these [python-based tools](https://github.com/OpenHumans/open-humans/wiki/Downloading-data-shared-with-your-project) created by Dana Lewis. The following instructions are an updated version:
**As a note**: most commands are initiated from the Terminal unless otherwise noted; macOS users will either be using Bash or Zsh depending on their version of macOS, whereas Windows 10 users should [install Bash](https://itsfoss.com/install-bash-on-windows/), allowing them to follow the same set of instructions.
1. Install ```pyenv```, which manages python environments. We are effectively "sandboxing" these tools so that they do not interact with macOS "default python". This will be done using HomeBrew and is adapted from these instructions from [Matthew Broberg and Moshe Zadka](https://opensource.com/article/19/5/python-3-default-mac):
```
$ brew install pyenv
```
2. Install the latest version of Python and set it as your global default:
```
$ pyenv install 3.7.3
$ pyenv global 3.7.3
# now verify that it worked for pyenv, python, and pip (which should update alongside python)
$ pyenv version
$ python3 --version
$ pip3 --version
```
3. Configure pyenv—this will confirm that we are using the correct version of python with pyenv:
```
$ echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bash_profile
# use ~/.zshrc for later versions of macoS 
```
* **Note**: please check for any extra commands stored in the configuration file that could mess with the pyenv-specific commands; check for exact syntax and clearly demarcated spaces between commands
4. Install ```open-humans-api```; as this is not a global installation, run the following command:
```
$ pip install open-humans-api
# to upgrade later, use the following command:
$ pip install open-humans-api --upgrade
```
5. Success! At this stage, unless you are downloading data directly from Open Humans, move on to [CONVERTING DATA](#converting-data).
6. Navigate to your desktop and create a directory for your data:
```
$ cd ~/Desktop
$ mkdir MyProjectData
```
7. In your web browser, navigate to Open Humans, login using the OPEN credentials (see [OPEN HUMANS DIRECT ACCESS](#open-humans-direct-access) for more information), then navigate to the upper right dropdown menu “My Account” and click “Manage Projects”; under “Your OAuth2.0 Projects”, click “OPEN” listed under “Project Names”.
8. Refresh the Master Access Token (see [ACCESS OH DATA AND METADATA](#access-oh-data-and-metadata)) and enter it into the following command to download ALL of your Open Humans data:
```
$ ohproj-download -T <MASTER_ACCESS_TOKEN> -d MyProjectData
```
* **Note**: Downloading all data at once is NOT recommended for initial troubleshooting. [Tips for Pulling Data from Open Humans Projects](https://github.com/OpenHumans/open-humans/wiki/Tips-for-Pulling-Data-from-Open-Humans-Projects) provides multiple different commands for accessing and working with your Open Humans data.
Congratulations! — You have now downloaded your Open Humans Data, which you will find as JSON files compressed to .gz zip files… For more options, run
```
$ ohproj-download --help
```
or visit the Open Humans GitHub page for more information.

***
 
### CONVERTING DATA:
Converting from json to csv is an optional (but recommended) step. These [Open Humans Data Tools](https://github.com/danamlewis/OpenHumansDataTools) will allow you to accomplish this, along with other functions. For a simplified way to convert, please use the script ```simple-unzip-csvify-OH-data.sh```. These next steps provide the necessary components for running it and other future scripts to be developed:
1. Install ```complex-json2csv``` and ```jsonsplit.sh```:
```
$ npm install -g complex-json2csv
$ npm install -g json
# use of sudo may be necessary depending on system security, but be careful and absolutely certain of what commands you're running and in which directory they are run in
```
2. Following successful installation, you can either clone the [data tools repository](https://github.com/danamlewis/OpenHumansDataTools) or download them as a zip file. Tools will be found within the containing folder ```~/OpenHumansDataTools/bin``` and can be run using:
```
$ bash <SCRIPT_NAME.sh>
````
The script ```simple-unzip-csvify-OH-data.sh``` can be run in the same way from this repository.
Congratulations! You have successfully converted your files to csv formatting.
Dana Lewis’ [JSON repo](https://github.com/danamlewis/json) has more information, as does [npmjs](https://www.npmjs.com/package/complex-json2csv).

***

### VERSIONING:
Due to the size and complexity of the dataset—as well as OPEN’s privacy protection using the Gateway—versioning of the dataset is not necessary. Tebbe Ubben performed the Open Humans data download from the Big OPEN Survey on 01.12.2020, compressing all participant files into a single password protected zip file, internally referred to as the "frozen" dataset. Those requesting access to the dataset should submit a data request form, at which point Drew Cooper will update access permissions and send the zip password. Individuals need simply convert zip files for accessibility, and work based on their specific analysis requirements.

***

### STORAGE:
All data will be stored in Google Drive within the folder “Databank_UCD_DRIVE".
 
Long-term storage will be managed by the responsible data archiver Dr. Shane O’Donnell. Access to these files is only possible through submission of a data request form to the responsible data archiver (found in the WP3 folder). Errors found in the dataset (either by OPEN consortium members or outside collaborators) should be reported to the responsible data archiver, who will delegate cleaning duties and integrate the relevant changes into the dataset.

***

### OPEN HUMANS DIRECT ACCESS:
Those who have access to the OPEN on Open Humans profile have a slightly different protocol to follow. The credentials for OPEN on OH are stored in Bitwarden. Accessing these credentials requires logging into your Bitwarden Vault with your email address and master password. Within “My Vault”, you will see an item titled “Open Humans Account”, which contains the login credentials. Enter this information into the login field on the Open Humans website to login to OPEN on OH. Access to OPEN on OH is currently granted to Shane, Katarina, Hanne, Drew and Tebbe.
 
### ACCESS OH DATA AND METADATA:
1. In the upper righthand corner dropdown, click on “My Projects”
2. On the new landing page, click on “OPEN” under “Projects”
3. Use the provided Master Access Token and specified link to access participant data; paste the access token into the appropriate link and load into the browser
4. You now have access to OPEN on OH participant data!
