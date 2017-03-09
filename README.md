## GitLab Helm Charts

This repo is a collection of help charts (currently just `gitlab-ce` and `gitlab-runner`). 
The repo automatically publishes to our chart repo, [charts.gitlab.io](https://charts.gitlab.io) via GitLab Pages.

### Usage

Add GitLab Chart Repo:

```bash
$ helm repo add gitlab https://charts.gitlab.io
```

Then you can install charts using the  `gitlab` repo:

```bash
$ helm install gitlab/gitlab-ce
```
