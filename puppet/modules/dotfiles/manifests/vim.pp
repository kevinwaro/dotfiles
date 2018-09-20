class dotfiles::vim {
    $username = $::dotfiles::username
    $group = $::dotfiles::group

    package { 'vim':
      ensure => installed
    }

    file { "/home/$username/.vim":
      owner => $username,
      group => $group,
      ensure => directory
    }
   
    file { "/home/$username/.vim/autoload":
      owner => $username,
      group => $group,
      ensure => directory
    }

    file { "/home/$username/.vim/bundle":
      owner => $username,
      group => $group,
      ensure => directory
    }

    exec { "curl -LSso /home/$username/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim":
      path => ['/usr/bin', '/usr/sbin'],
      user => $username,
      group => $group,
    }

    exec { "git clone https://github.com/vim-airline/vim-airline.git":
      path => ['/usr/bin', '/usr/sbin'],
      user => $username,
      group => $group,
      cwd => "/home/$username/.vim/bundle/"
    }

    exec { "git clone https://github.com/vim-syntastic/syntastic.git":
      path => ['/usr/bin', '/usr/sbin'],
      user => $username,
      group => $group,
      cwd => "/home/$username/.vim/bundle/"
    }

    exec { "git clone https://github.com/scrooloose/nerdtree":
      path => ['/usr/bin', '/usr/sbin'],
      user => $username,
      group => $group,
      cwd => "/home/$username/.vim/bundle/"
    }

    file { "/home/$username/.vimrc":
      owner => $username,
      group => $group,
      source => "puppet:///modules/dotfiles/vim/.vimrc"
    }
}
