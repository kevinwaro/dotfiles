class dotfiles::tmux {
    $username = $::dotfiles::username
    $group = $::dotfiles::group

    package { 'tmux':
      ensure => installed
    }

    file { "/home/$username/.tmux.conf":
      owner => $username,
      group => $group,
      source => "puppet:///modules/dotfiles/tmux/.tmux.conf"
    }
}
