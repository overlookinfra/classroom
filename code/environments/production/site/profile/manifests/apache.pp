class profile::apache (
  String $servername = $facts[networking][fqdn],
  String $content    = "Hello from ${servername}\n",
) {
  class { 'apache':
    default_vhost => true,
  }

  # apache::vhost { "${servername} (non SSL)":
  #   servername => $servername,
  #   port       => 80,
  #   docroot    => '/var/www/html',
  # }
  # file { '/var/www/html/index.html':
  #   ensure  => file,
  #   content => $content,
  # }
}
