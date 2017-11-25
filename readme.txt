README
------

All the notes here apply to a Linux system and have been checked on both Ubuntu
and Fedora.

Project location
----------------
There are no specific requirements. In a terminal cd to the desired location.

To get the files from the archive, just extract it using

    tar xvf crossover.assignment.project_evaluation.tar.gz
    
From github just clone the repo using

    git clone https://github.com/serbant/crossover.assignment.project_evaluation.git
    
Either way, the directory crossover.assignment.project_evaluation is created.
Change to said directory. 

     

Dependencies
------------
Google chrome stable (not chromium) is installed using the kit from
https://chrome.google.com and the chromedriver is available under /usr/bin.

The chromedriver is available from the webdriver/binaries/linux/googlechrome/64bit/
 Copy it to /usr/bin, change ownership to root, and the mode to 755.
 
 Running the tests using maven
 -----------------------------
 
 From the directory noted above, execute
 
    mvn integration-test -Dwebdriver.base.url=https://www.crossover.com
    
Note that it is also possible to specify the target browser if one so desires

    mvn integration-test -Dwebdriver.base.url=https://www.crossover.com -Pgooglechrome
    
    mvn integration-test -Dwebdriver.base.url=https://www.crossover.com -Pfirefox
    
    mvn integration-test -Dwebdriver.base.url=https://www.crossover.com -Pphantomjs
    
The firefox command may work with Firefox 55 and earlier. I was able to run
that on Firefox installation with a lot of non default about:config entries.

The phantomjs fails all over the place because if incompatibilities with the
javascript libraries used on crossover.com.

Running the tests in docker
---------------------------

In the directory listed above there is a Dockerfile that provides for running
the above chrome tests in a docker container.

To build the docker image, execute:

    sudo docker build -t $whateveryouwantocallit .
    
To run the image, execute:

    sudo docker run -i -t $whateveryoucalleditabove 
