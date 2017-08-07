FROM docker.io/centos/nodejs-6-centos7
COPY ./oracle-instantclient12.2-basic-12.2.0.1.0-1.x86_64.rpm ./
COPY ./oracle-instantclient12.2-devel-12.2.0.1.0-1.x86_64.rpm ./
USER root
RUN yum install -y  libaio && \
    rpm -Uvh oracle-instantclient12.2-basic-12.2.0.1.0-1.x86_64.rpm && \
    rpm -Uvh oracle-instantclient12.2-devel-12.2.0.1.0-1.x86_64.rpm
USER 1001
npm install yarn -g
ENV LD_LIBRARY_PATH="/usr/lib/oracle/12.2/client64/lib":$LD_LIBRARY_PATH
ENV OCI_HOME="/usr/lib/oracle/12.2/client64"
ENV OCI_LIB_DIR="/usr/lib/oracle/12.2/client64/lib"
