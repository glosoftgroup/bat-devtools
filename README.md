## Check Node and Yarn Availability
#### Setup
 1. Download yarn msi to local repository i.e yarn-1.12.3 or yours and rename in the yarn_setup.bat
 2. Setting up node and yarn
   - run node_yarn_setup.bat which runs in admin mode
   - This bat file contains node_setup.bat and yarn_setup.bat. It is used for checking whether node and yarn are available. If node is not available, it downloads and installs the node msi file. If it finds that yarn is not available it installs the one locally downloaded since remote download is not possible using the bat file.
   - both node_setup and yarn_setup log into their respective files during the installation process
 2. Check if node has been install using the validate_setup.bat
   - A seperate bat file is needed for the session
   - Saves results to a status.json file
