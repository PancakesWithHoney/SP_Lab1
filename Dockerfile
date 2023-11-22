FROM debian:latest
WORKDIR /app 
COPY lab.sh .
RUN chmod +x lab.sh 
RUN touch first.txt second.txt third.txt DONTTOUCHIT.txt 1.txt
CMD ["./lab.sh"]