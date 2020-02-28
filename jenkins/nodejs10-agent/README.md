## jenkins-nodejs10-agent

This is an [OpenShift][openshift] template intended to-be-used as a
build agent for a [Jenkins][jenkins] instance provided by OpenShift (i.e.
created using the `jenkins-persistent` template). It includes:

- [NodeJS][nodejs] 10 LTS
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
$ oc new-app https://raw.githubusercontent.com/futurice/openshift-templates/master/jenkins/nodejs10-agent/template.yml
$ oc start-build jenkins-nodejs10-agent
```

Now, in your `Jenkinsfile` specify the following:

```
pipeline {
  agent {
    node { label 'nodejs10' }
  }
  ...
}
```

When this pipeline is run, Jenkins will discover that there is an imagestream
with the label `role: jenkins-slave` and the annotation `slave-label: nodejs10`,
automatically start a pod with this agent and run the pipeline within.
