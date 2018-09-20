class dotfiles::bash {
    $username = $::dotfiles::username
    $group = $::dotfiles::group

    file { "/home/$username/.bashrc":
      owner => $username,
      group => $group,
      source => "puppet:///modules/dotfiles/bash/.bashrc"
    }

    file { "/home/$username/.bash_aliases":
      owner => $username,
      group => $group,
      source => "puppet:///modules/dotfiles/bash/.bash_aliases"
    }
}
