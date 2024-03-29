class ant {

  $ant_provider = $::osfamily ? {
    'Darwin' => 'brew',
    'RedHat' => 'yum',
  }

  package { 'ant':
    ensure        => installed,
    provider      => $ant_provider,
    allow_virtual => false,
  }

  file { [
    "${::home}/.ant",
    "${::home}/.ant/lib",
  ]:
    ensure => directory,
  }

  $antlibs = [
    'commons-net-3.0.1.jar',
    'compiler.jar',
    'yuicompressor-2.4.7.jar',
  ]

  $antlibs.each |$antlib| {
    file { "${::home}/.ant/lib/${antlib}":
      ensure => file,
      source => "puppet:///modules/ant/${antlib}",
      mode   => '0644',
    }
  }

  file { "${bertha::website_home}/build.xml":
    ensure  => file,
    content => template('ant/build.xml.erb')
  }

  bertha::gitignore { 'dist': }

}
