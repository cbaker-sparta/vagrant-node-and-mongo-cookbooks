include_attribute 'nodejs::default'
include_attribute 'nodejs::repo'

default['nodejs']['packages'] = value_for_platform_family(
  'debian' => node['nodejs']['install_repo'] ? ['nodejs'] : ['nodejs', 'npm', 'mongoose', 'nodejs-dev'],
  %w(rhel fedora amazon) => node['nodejs']['install_repo'] ? ['nodejs', 'nodejs-devel'] : ['nodejs', 'npm', 'mongoose', 'nodejs-dev'],
  'suse' => node['platform_version'].to_i < 42 ? ['nodejs', 'nodejs-devel'] : ['nodejs4', 'npm4', 'nodejs4-devel'],
  'mac_os_x' => ['node'],
  'freebsd' => %w(node npm),
  'default' => ['nodejs']
)
