class profile::rvm {
  include '::rvm'

  $ruby_version = 'ruby-1.9.3-p551'
  rvm_system_ruby { $ruby_version:
    ensure      => present,
    default_use => true,
  }

  $rvm_gems = [
    'rspec-puppet',
    'puppet',
    'fpm',
    'puppet-lint',
    'puppetlabs_spec_helper',
  ]
  rvm_gem { $rvm_gems:
    ruby_version => $ruby_version,
    ensure       => latest,
    require      => Rvm_system_ruby[$ruby_version],
  }
}
