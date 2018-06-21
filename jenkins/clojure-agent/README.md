## jenkins-clojure-agent

This is an [OpenShift][openshift] template intended to-be-used as a
build agent for a [Jenkins][jenkins] instance provided by OpenShift (i.e.
created using the `jenkins-persistent` template). It includes:

- [OpenJDK 8][openjdk]
- [Leiningen][lein] 2.8.1

[openshift]: https://openshift.com
[jenkins]: https://jenkins.io/
[openjdk]: http://openjdk.java.net/
[leiningen]: https://leiningen.org/

### Usage

Build the agent image in a project your Jenkins app has access to:

```
$ oc new-app https://raw.githubusercontent.com/futurice/openshift-templates/master/jenkins/clojure-agent/template.yml
$ oc start-build jenkins-clojure-agent
```

Now, in your `Jenkinsfile` specify the following:

```
pipeline {
  agent {
    node { label 'clojure' }
  }
  ...
}
```

When this pipeline is run, Jenkins will discover that there is an imagestream
with the label `role: jenkins-slave` and the annotation `slave-label: clojure`,
automatically start a pod with this agent and run the pipeline within.
