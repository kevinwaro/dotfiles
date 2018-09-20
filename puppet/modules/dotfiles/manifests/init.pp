class dotfiles {

    $username = "vagrant"
    $group = "vagrant"

    package { 'git':
      ensure => installed
    }

    package { 'curl':
      ensure => installed
    }
}
