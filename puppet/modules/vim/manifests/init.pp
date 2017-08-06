class vim {

    package { 'git':
       ensure => "present",
    }

    package { 'vim':
       ensure => "present",
    }

    file { '/home/vagrant/.vimrc':
       source  => 'puppet:///modules/vim/.vimrc',
       owner   => 'vagrant',
       group   => 'vagrant',
       mode    => '640',
       require => Package['vim'],
    }

    file { '/home/vagrant/.vim':
       ensure => 'directory',
       owner   => 'vagrant',
       group   => 'vagrant',
       mode    => '640',
       require => Package['vim'],
    }

   file { '/home/vagrant/.vim/bundle':
       ensure => 'directory',
       owner   => 'vagrant',
       group   => 'vagrant',
       mode    => '640',
       require => File['/home/vagrant/.vim'],
    }

   file { '/home/vagrant/.vim/autoload':
       ensure => 'directory',
       owner   => 'vagrant',
       group   => 'vagrant',
       mode    => '640',
       require => File['/home/vagrant/.vim'],
    }

    exec { 'wget  https://tpo.pe/pathogen.vim ':
       command => 'wget  https://tpo.pe/pathogen.vim',
       cwd     => '/home/vagrant/.vim/autoload/',
       creates => '/home/vagrant/.vim/autoload/pathogen.vim',
       require => File['/home/vagrant/.vim'],
       path    => ['/usr/bin', '/usr/sbin',],
    }

    exec { 'git clone https://github.com/vim-airline/vim-airline':
       command => 'git clone https://github.com/vim-airline/vim-airline',
       cwd     => '/home/vagrant/.vim/bundle',
       creates => '/home/vagrant/.vim/bundle/vim-airline',
       require => File['/home/vagrant/.vim'],
       path    => ['/usr/bin', '/usr/sbin',],
    }
}
