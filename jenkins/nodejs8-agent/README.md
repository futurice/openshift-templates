## jenkins-nodejs8-agent

This is an [OpenShift][openshift] template intended to-be-used as a
build agent for a [Jenkins][jenkins] instance provided by OpenShift (i.e.
created using the `jenkins-persistent` template). It includes:

- [NodeJS][nodejs] 8 LTS
- [yarn][yarn]
- [npm][npm]

[openshift]: https://openshift.com
[jenkins]: https://jenkins.io/
[nodejs]: https://nodejs.org/en/
[yarn]: https://yarnpkg.com/en/
[npm]: https://www.npmjs.com/

### Usage

Build the agent image in a project your Jenkins app has access to:

```
$ oc new-app https://raw.githubusercontent.com/futurice/openshift-templates/master/jenkins/nodejs8-agent/template.yml
$ oc start-build jenkins-nodejs8-agent
```

Now, in your `Jenkinsfile` specify the following:

```
pipeline {
  agent {
    node { label 'nodejs8' }}
  }
  ...
}
```

When this pipeline is run, Jenkins will discover that there is an imagestream
with the label `role: jenkins-slave` and the annotation `slave-label: nodejs8`,
automatically start a pod with this agent and run the pipeline within.
