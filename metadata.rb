name 'devopsbox'
maintainer 'Strata Consulting, Inc.'
maintainer_email 'todd@strataconsulting.com'
license 'Apache 2.0'
description 'Builds a DevOps workstation'
long_description 'Builds a DevOps workstation'
source_url 'https://github.com/strataconsulting/devopsbox-cook' if respond_to?(:source_url)
issues_url 'https://github.com/strataconsulting/devopsbox-cook/issues' if respond_to?(:issues_url)
version '0.2.0'

depends 'ark'
depends 'apt'
depends 'build-essential'
depends 'chef-dk'
depends 'cloudcli'
depends 'docker'
depends 'golang'
depends 'terraform'
depends 'tmux'
depends 'packer', '~> 0.4.2'
depends 'yum-epel'

