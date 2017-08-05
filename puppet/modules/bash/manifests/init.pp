class bash {

    package { 'bash':
       ensure => "present",
       before => "File['/home/vagrant/.bashrc']"
    }

    file { '/home/vagrant/.bashrc':
       source  => 'puppet:///modules/bash/.bashrc',
       owner   => 'vagrant',
       group   => 'vagrant',
       mode    => '640',
       require => Package['bash'];
    }

}
