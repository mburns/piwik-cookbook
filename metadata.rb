name 'piwik'
maintainer 'Michael Burns'
maintainer_email 'michael@mirwin.net'
license 'Apache-2.0'
description 'Installs/Configures piwik'
version '0.2.4'
chef_version '>= 12' if respond_to?(:chef_version)

issues_url 'https://github.com/mburns/piwik-cookbook/issues'
source_url 'https://github.com/mburns/piwik-cookbook'

recipe 'piwik::default', 'Installs and configures piwik'
recipe 'piwik::master', "This recipe installs piwik on one host and let's you configure it by hitting /index.php. It will run archive.sh hourly on this host"
recipe 'piwik::slave', 'This recipe installs a piwik instance which connects as additional tracking server to an existing piwik instance (DB)'

depends 'mysql'
depends 'runit'
depends 'nginx'
depends 'iptables'
depends 'logrotate'

supports 'ubuntu'
supports 'centos'
