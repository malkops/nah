FROM centos:7

COPY requirements.txt requirements.txt

RUN yum install -y gcc \
        openssl-devel \
        bzip2-devel \
        libffi-devel \
        zlib-devel \
        xz-devel \
        wget \
        make && \
    wget -q https://www.python.org/ftp/python/3.7.11/Python-3.7.11.tgz && \
    tar xzf Python-3.7.11.tgz && \
    cd Python-3.7.11 && \
    ./configure --enable-optimizations && \
    make altinstall && \
    rm -f /usr/bin/python  && \
    mv ./python /usr/bin/ && \
    cd .. && \
    rm -rf Python-3.7.11.tgz Python-3.7.11 && \
    python -m pip install --no-cache-dir -r requirements.txt

WORKDIR /python_api
COPY python-api.py python-api.py

CMD [ "python", "python-api.py" ]
