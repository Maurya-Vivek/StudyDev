Readme file for the poc
=======================

To create an image from this project download/clone the mystudy branch and goto the **DockerPoc** dir and then run the following commands

	* To create image from the dockerfile run
	
		```bash
		$ docker build -f cmdArgsoverride.dockerfile -t cmd-Args-Override .
		```
This will create an image with tag cmd-Args-Override, to run with default cmd command which we defined in the dockerfile run:

	* Run container with default args
	
		```bash
		$ docker run --name poc -d cmd-Args-Override
		```
		
This will run the while loop forever inside the container and same can be checked in the logsS, now to check our POC to override the values run:

	* Run container with user defined runtimevalues
	
		```bash
		$ docker run --name demo -d script-demo false UsersfirstArg UserssecoundArg
		```

