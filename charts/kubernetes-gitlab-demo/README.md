# kubernetes-gitlab-demo
This work is based partially on: https://github.com/lwolf/kubernetes-gitlab/. GitLab would like to thank Sergey Nuzhdin for his work.

[GitLab Community Edition](https://about.gitlab.com/) is an application to code, test, and deploy code together. It provides Git repository management with fine grained access controls, code reviews, issue tracking, activity feeds, wikis, and continuous integration.


## Introduction

This chart is provided for the deployment and testing of [GitLab](https://about.gitlab.com) on [Kubernetes](https://kubernetes.io/) via [Google Container Engine](https://cloud.google.com/container-engine/). This provides functionality used in the [GitLab Idea to Production demo on GKE presentation](https://about.gitlab.com/handbook/sales/demo/) from the [GitLab handbook](https://about.gitlab.com/handbook). Please use that script when providing this demo to customers, instead of these instructions directly.

This includes:

- A [GitLab Omnibus](https://docs.gitlab.com/omnibus/) Pod, including Mattermost, Container Registry, and Prometheus
- GitLab Runner
- Redis
- Postgresql

Terms:

-  Google Cloud Platform (**GCP**)
-  Google Container Engine (**GKE**)
-  Kubernetes (**k8s**)

## Prerequisites

-  [Google Cloud Platform](https://cloud.google.com/) account. This can be a trial, or paid account. The trial has lower limitations, so extensive
testing with GitLab's Review Apps feature may exceed those limitations.
-  [Google Cloud SDK](https://cloud.google.com/sdk/) for using `gcloud` commands. This SDK also includes the necessary `kubectl` utilities.
-  Access to a `bash` shell. It is recommended at this time to use a GNU/Linux-based or OSX operating system.
-  Access to the internet via HTTPS traffic.

- _At least_ 3 GB of RAM available on your cluster
- _At least_ 2vCPUs per node in your cluster
- Kubernetes 1.4+ with Beta APIs enabled
- The ability to point a DNS entry or URL at your GitLab install

## Installing the Chart

To install the chart with the release name `my-release` run:

```bash
$ helm repo add gitlab https://charts.gitlab.io
$ helm install --name my-release \
    --set baseIP=172.16.254.1,baseDomain=example.com,legoEmail=you@example.com \
    gitlab/kubernetes-gitlab-demo
```

Note that you _must_ pass in baseIP, baseDomain, and legoEmail, or you'll end up with a non-functioning release.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```bash
$ helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

Refer to [values.yaml](values.yaml) for the full run-down on defaults. These are a mixture of Kubernetes and GitLab-related directives.

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example,

```bash
$ helm install --name my-release \
    --set baseIP=172.16.254.1,baseDomain=example.com,legoEmail=you@example.com, \
    --set postgresPassword=foobar
    gitlab/kubernetes-gitlab-demo
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install --name my-release -f values.yaml gitlab/kubernetes-gitlab-demo
```

> **Tip**: You can use the default [values.yaml](values.yaml)

## Persistence

Persistence of GitLab data and configuration happens using PVCs. If you know that you'll need a larger amount of space, make _sure_ to look at [values.yaml](values.yaml) for values you can override.