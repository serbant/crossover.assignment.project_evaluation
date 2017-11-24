FROM selenium/standalone-firefox

# get maven (and java and all its other depencencies)
RUN sudo apt-get -qq update
RUN sudo apt-get -qq -y install apt-utils
RUN sudo apt-get -qq -y install openjdk-8-jdk
RUN sudo apt-get -qq -y install maven
RUN sudo apt-get -qq -y install git

# get the sources
RUN sudo git clone --progress https://github.com/serbant/crossover.assignment.project_evaluation.git /crossover.assignment.project_evaluation
WORKDIR /crossover.assignment.project_evaluation
RUN sudo git pull
RUN sudo git checkout master
RUN sudo git show

EXPOSE 4444

CMD [ "mvn", "--version" ]
CMD [ "sudo", "mvn", "clean", "integration-test", "-Dwebdriver.base.url=https://www.crossover.com" ]
