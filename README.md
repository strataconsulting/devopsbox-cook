# devopsbox Cookbook

## Description

`devopsbox` is a role cookbook that installs an opinionated set of DevOps tools to enable teams to move beyond fighting with their workstations to the blissful business of infrastructure hacking.

__Notes:__
 * This cookbook is very much __work in progress__. It will get better.
 * You're are invited to help make it better, through pull requests and/or GitHub issues.
 * My goal is to open source this once it's providing value and has been approved by InfoSec.

## Requirements

### Platforms

 * CentOS 7

### Chef

 * Chef 12

### Cookbooks

 * [ark](https://github.com/burtlo/ark)
 * [cloudcli](https://github.com/nickryand/cloudcli-cookbook)
 * [build-essential](https://github.com/chef-cookbooks/build-essential)
 * [chef-dk](https://github.com/RoboticCheese/chef-dk-chef)
 * [docker](https://github.com/chef-cookbooks/docker)
 * [golang](https://github.com/NOX73/chef-golang)
 * [tmux](https://github.com/stevendanna/tmux)

## Usage

Add `devopsbox::default` as first item in node run_list if you want everything installed. If you want to exclude components just add those components' recipes to your run_list.

## Attributes

### chef_dk

```ruby
default['chef_dk']['version'] = 'latest'
default['chef_dk']['package_url'] = nil
default['chef_dk']['global_shell_init'] = true
```

### terraform

```ruby
default['terraform']['version'] = '0.6.15'
default['terraform']['zipfile'] = "terraform_#{node['terraform']['version']}_" \
  "#{node['os']}_#{node['terraform']['arch']}.zip"
```

## Recipes

### aws

 * Installs [AWS Command Line Interface](https://aws.amazon.com/cli/).

### bash

 * Creates some helper aliases.
 * Configures Bash prompt.
 * Configures Git prompt.

#### Bash Prompt

```
vagrant@default-centos-71 19:35:47  ~/foo
$
```

#### Git Prompt

```
vagrant@default-centos-71 19:35:48 (master) ~/foo
$ git checkout -b develop
Switched to a new branch 'develop'
vagrant@default-centos-71 19:36:06 (develop) ~/foo
$
```

### chef-dk

 * Installs [Chef Development Kit](https://downloads.chef.io/chef-dk/).
 * Adds ChefDK environment helper to `/etc/profile.d`, providing, among other things, bash auto-completion.

### default

Primarily an aggregator recipe that includes all other recipes and:

 * installs OS devtools
 * installs some useful RPMs
 * installs TMUX via upstream `tmux` cookbook

### direnv

 * Installs [Go](https://golang.org/) (prerequisite)
 * Installs [direnv](http://direnv.net/)

### docker

 * Installs [Docker Engine](https://www.docker.com/products/docker-engine)

### hub

 * Installs [Hub](https://github.com/github/hub), GitHub's Git command line wrapper.
 * Adds Hub environment helper to `/etc/profile.d`.
 * Configures Bash auto-completion.

## Todos & Bugs

 * Diagnose non-impactful ChefSpec failures.
 * Add Ubuntu support.
 * Install [Vault](https://www.vaultproject.io/).
 * Install [Otto](https://www.ottoproject.io/).
 * Install [Ansible](https://www.ansible.com/).
 * Install [ChefVM](https://github.com/trobrock/chefvm).
 * Make Bash templates less brittle w/ conditionals. (e.g. don't add Chef fu if Chef is not installed).
 * Clean-up old versions of Terraform after upgrades.

## License and Authors

 * Author: Todd Michael Bushnell (<todd@strataconsulting.com>)

```text
Copyright (c) 2016 Strata Consulting, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
