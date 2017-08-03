## GitLab Helm Charts

This repo is a collection of GitLab Helm charts.
The repo automatically publishes to our chart repo, [charts.gitlab.io](https://charts.gitlab.io) via GitLab Pages.

Charts in this repository should be considered beta. We are building a set of Cloud Native
charts at a separate repo at [helm.gitlab.io](https://gitlab.com/charts/helm.gitlab.io). The goal of that work
is to fully replace the charts in this repository as well as [the community supported charts](https://github.com/kubernetes/charts/tree/master/stable/gitlab-ce).
For more details, see the discussion and a [conclusion in issue #15](https://gitlab.com/charts/charts.gitlab.io/issues/15#note_36465690).

### Usage

To use the charts, the Helm tool must be installed and initialized. The best
place to start is by reviewing the [Helm Quick Start Guide](https://github.com/kubernetes/helm/blob/master/docs/quickstart.md).

Installation instructions, including configuration options, can be found in our [documentation](http://docs.gitlab.com/ce/install/kubernetes/).

The charts currently available to install can be found here: <https://gitlab.com/charts/charts.gitlab.io/tree/master/charts>

### GitLab Helm Charts Issue Tracker

Issues related to the Charts can be logged at: <https://gitlab.com/charts/charts.gitlab.io/issues>

### Contributing to the Charts

We welcome contributions and improvements. The source repo for our Helm Charts can be found here: <https://gitlab.com/charts/charts.gitlab.io>
