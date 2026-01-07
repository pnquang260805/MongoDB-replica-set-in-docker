FROM mongo:6.0.27

WORKDIR /setup
COPY . .
RUN chmod +x setup.sh

CMD [ "./setup.sh" ]