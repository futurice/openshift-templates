## jenkins-nodejs10-agent

This is an [OpenShift][openshift] image intended to-be-used as a
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
The Dockerfile is amended to be build locally.
```
docker build -t registry.pro-eu-west-1.openshift.com/ci/jenkins-nodejs10-agent .
```
Thereafter the image can be pushed with:
```
docker push registry.pro-eu-west-1.openshift.com/ci/jenkins-nodejs10-agent
```
> Mind that the pullStrategy needs to be set to "Always" to pick up the new version.

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
