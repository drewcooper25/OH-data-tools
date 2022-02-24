###### This is a new and improved version of the beloved Open Humans README that you all know and love.

###### Here we go! Pretty much just gonna copy and paste text into the document.

***

# The OPEN Project Data Management Instructions — Open Humans V2.0

***

## GENERAL USAGE NOTES:
This is an instructional text for downloading and working with Open Humans data. Open Humans is a data repository service that OPEN is using to store NightScout, Android APS, OpenAPS and [hopefully soon] iOS looping data from DIYAPS users.
While it is recommended to read through the Data Management Plan in full to get a detailed sense of the data pipeline, management expectations and ultimate fate of the dataset, this READ_ME will provide you with enough information to confidently work with the data. Please do report back to Drew Cooper if any problems arise.

***
 
### DOWNLOADING DATA:
Downloading data from Open Humans can be done using these python-based tools. The following instructions are an updated version of the instructions found at the above link:
1. Almost all commands are initiated from the Terminal found in the “Utilities” folder; macOS users will either be using Bash or Zsh depending on their version of macOS, whereas Windows 10 users should install Bash, allowing them to follow the same set of instructions.
2. Install ```pyenv```; we will be “sandboxing” this software to avoid conflicts with the OS that could arise from a “global” installation (this will help you install both python3 and pip3); you can check for successful installation of the correct versions using ```python3 --version``` and ```pip3 --version```.
* **Note**: please check for any extra commands stored in the configuration file that could mess with the pyenv-specific commands; check for exact syntax and clearly demarcated spaces between commands
3. Install ```open-humans-api```; as this is not a global installation, run the following command: ```pip install open-humans-api``` (to upgrade later, use ```pip install open-humans-api --upgrade```).
4. Success! At this stage, unless you are downloading data directly from Open Humans, move on to CONVERTING DATA.
5. Navigate to your desktop: ```cd ~/Desktop```.
6. Create a directory for your data: ```mkdir MyProjectData```.
7. In your web browser, navigate to Open Humans, login using the OPEN credentials, then navigate to the upper right dropdown menu “My Account” and click “Manage Projects”; under “Your OAuth2.0 Projects”, click “OPEN” listed under “Project Names”.
8. Refresh the Master Access Token; copy and paste the following command into Terminal as a single line to download ALL of your Open Humans data: ```ohproj-download -T <MASTER_ACCESS_TOKEN> -d MyProjectData```.
* **Note**: Downloading all data once is NOT recommended for initial troubleshooting. Tips for Pulling Data from Open Humans Projects provides multiple different commands for accessing and working with your Open Humans data.
9. Congratulations! — You have now downloaded your Open Humans Data, which you will find as JSON compress to .gz files… For more options, run ```ohproj-download --help``` or visit the Open Humans GitHub page for more information.

***
 
### CONVERTING DATA:
Converting from json to csv is an optional (but recommended) step — these Open Humans Data Tools will allow you to accomplish this. The following instructions are again an updated version found at the above link:
1. Before you can run the Data Tools scripts you must install two tools: complex-json2csv and jsonsplit.sh. In Terminal, run ```npm install -g complex-json2csv```, followed by ```npm install -g json```. Dana Lewis’ JSON repo has more information, as does npmjs.
2. Following successful installation of these two tools, you have multiple options for downloading the Open Humans Data Tools themselves. On the Data Tools repo, the green “Code” dropdown offers the option to clone the repo (good for those who wish to make contributions to the codebase), open with GitHub Desktop, or download as a zip file.
3. You should now be able to run any of the Open Humans Data Tools from within the parent folder of the script. For example, if the data tools folder is stored on the Desktop: ```cd Desktop/OpenHumansDataTools/bin```—all data processing scripts should be contained therein.
Enter ```bash <SCRIPT_NAME.sh>``` to run the script.
* **Note**: use of “sudo” before certain commands (i.e. ```sudo install <REST_OF_CODE>```) may be necessary for running install commands depending on your system security. Be aware of which directory you’re in and what commands you are running when using sudo!
4. For an updated conversion script, use this OH Data Tool. Change the first cd so that the directory reflects the containing folder of the files you wish to convert. Indicate which data types you want converted (entries, devicestatus, etc.). Run the script the same as the original Data Tools.
5. Congratulations! You have successfully converted your files to csv formatting.

***

### VERSIONING:
Tebbe Ubben will perform the Open Humans data download from the Big OPEN Survey, compressing all participant files into a single password protected zip file, which will be stored in Google Drive. Those requesting access to the dataset should submit a data request form, at which point Drew Cooper will update access permissions and send the zip password.
 
Due to the size and complexity of the dataset—as well as OPEN’s privacy protection using the Gateway—versioning of the dataset is not necessary. Individuals need simply convert zip files for accessibility, and work based on their specific analysis requirements.

***

### STORAGE:
All data will be stored in Google Drive within the folder “Databank_UCD_DRIVE".
 
Long-term storage will be managed by the responsible data archiver Dr. Shane O’Donnell. Access to these files is only possible through submission of a data request form to the responsible data archiver (found in the WP3 folder). Errors found in the MASTER dataset (either by OPEN consortium members or outside collaborators with approved data request forms) should be reported to the responsible data archiver, who will delegate cleaning duties and integrate the relevant changes into the MASTER dataset.

***

### OPEN HUMANS DIRECT ACCESS:
Those who have access to the OPEN on Open Humans profile have a slightly different protocol to follow. The credentials for OPEN on OH are stored in Bitwarden. Accessing these credentials requires logging into your Bitwarden Vault with your email address and master password. Within “My Vault”, you will see an item titled “Open Humans Account”, which contains the login credentials. Enter this information into the login field on the Open Humans website to login to OPEN on OH. Access to OPEN on OH is currently granted to Shane, Katarina, Hanne, Drew and Tebbe.
 
### To access data (and metadata) on OH:
1. In the upper righthand corner dropdown, click on “My Projects”
2. On the new landing page, click on “OPEN” under “Projects”
3. Use the provided Master Access Token and specified link to access participant data; paste the access token into the appropriate link and load into the browser
4. You now have access to OPEN on OH participant data!
