name 'devopsbox'
maintainer 'Strata Consulting, Inc.'
maintainer_email 'todd@strataconsulting.com'
license 'all_rights'
description 'Builds a DevOps workstation'
long_description 'Builds a DevOps workstation'
source_url 'https://github.com/strataconsulting/devopsbox-cook' if respond_to?(:source_url)
issues_url 'https://github.com/strataconsulting/devopsbox-cook/issues' if respond_to?(:issues_url)
version '0.1.0'

depends 'chef-dk'
depends 'build-essential'
depends 'ark'
depends 'docker'
depends 'terraform'
