
# Cassandra-docker

Apache Cassandra and Elassandra docker images.

## Elassandra

### Building Docker Images

Run `build.sh` in the repository root. This first builds the `base-openjre` image,
which is a Debian Strech image with OpenJRE 8 (headless) installed, and then
builds the given distribution and version of cassandra.

For Elassandra, invoke `build.sh`:

```./build.sh elassandra 5.5.0.13```


### Openshift

The following steps assume that an OpenShift project named `myproject` has already been created
and that the OpenShift client (`oc`) has been configured to connect to the OpenShift cluster.

*Note*: The project name (k8s namespace) is used as part of DNS names specified in the Cassandra configuration files.
If you use an alternate project name, you'll need to replace all occurances of `myproject` with
the appropriate value.

It is also assumed that the Docker images have already been built and pushed to the local
OpenShift Docker registry. See _Building Docker Images_ above.

Create an `elassandra-config` ConfigMap containing the Cassandra/Elassandra configuration:

```oc create configmap elassandra-config --from-file=examples/elassandra/openshift/conf/```

Create an `elassandra` Service:

```oc apply -f examples/elassandra/openshift/elassandra-service.yaml```

Create the `elassandra` StatefulSet, which spawns 3 Elassandra nodes:

```oc create -f examples/elassandra/openshift/elassandra-statefulset.yaml```