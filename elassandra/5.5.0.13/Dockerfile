FROM base-openjre

#RUN dagi dpkg-dev libpython-stdlib libpython2.7-minimal libpython2.7-stdlib mime-support python python-minimal python2.7 python2.7-minimal

#COPY elassandra-5.5.0.13.deb /tmp/pkg/all/
#COPY cassandra-tools_3.11.2_all.deb /tmp/pkg/all/

COPY install-elassandra /tmp/install-elassandra

RUN /tmp/install-elassandra 5.5.0.13 3.11.2

COPY cassandra.sh /usr/sbin/cassandra
COPY nodetool.sh /usr/bin/nodetool
COPY cassandra.in.sh /usr/share/cassandra/
COPY readiness-probe.sh /usr/bin/readiness-probe

VOLUME /var/lib/cassandra
VOLUME /etc/cassandra

USER cassandra

# 7000: intra-node communication
# 7001: TLS intra-node communication
# 7199: JMX
# 9042: CQL
# 9160: thrift service
# 9200: elassandra HTTP
# 9300: elasticsearch transport
EXPOSE 7000 7001 7199 9042 9160 9200 9300

CMD ["/usr/sbin/cassandra"]

