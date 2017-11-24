FROM selenium/standalone-firefox

RUN sudo apt-get -qq update
RUN sudo apt-get -qq -y install maven

VOLUME "./"
EXPOSE 4444

CMD [ "ls", "-alth" ]
CMD [ "mvn", "--version" ]

CMD [ "mvn", "clean", "integration-test", "-Dwebdriver.base.url=https://www.crossover.com" ]
