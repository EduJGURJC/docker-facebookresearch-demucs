FROM python:3.10.4-slim

# Install Demucs
RUN pip3 install -U demucs

# Copy example
COPY test /test
# To download some cache dependencies
RUN demucs -d cpu test.mp3

ADD run.sh /

VOLUME /input
VOLUME /output

CMD ./run.sh