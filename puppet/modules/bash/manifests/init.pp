class bash {

    package { 'bash':
       ensure => "present",
    }

    file { '/home/vagrant/.bashrc':
       source  => 'puppet:///modules/bash/.bashrc',
       owner   => 'vagrant',
       group   => 'vagrant',
       mode    => '640',
       require => Package['bash'],
    }

    file { '/home/vagrant/.Xresources':
       source  => 'puppet:///modules/bash/.Xresources',
       owner   => 'vagrant',
       group   => 'vagrant',
       mode    => '640',
       require => File['/home/vagrant/.bashrc'];
    }
 
}
