FROM centos:7
LABEL enviornment=POC
LABEL purpose=TestRunTimeArgOverriding
RUN yum -y update && \
    yum -y install httpd && \
    yum clean all
COPY ./TestScript.sh /
RUN chmod +x /TestScript.sh
ENTRYPOINT ["/TestScript.sh"]
#Below we will specify the default arguments for cmd which if nothing is set in docker run command will get executed
CMD ["true", "defaultFirstArg", "defaultSecoundArg"]