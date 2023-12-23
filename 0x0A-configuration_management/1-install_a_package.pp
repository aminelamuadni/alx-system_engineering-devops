# Ensure Python 3.8.10, Flask 2.1.0, and Werkzeug 2.1.1 are installed

# Install Flask 2.1.0
package { 'flask':
  ensure   => '2.1.0',
  provider => 'pip3',
}

# Install Werkzeug 2.1.1
package { 'werkzeug':
  ensure   => '2.1.1',
  provider => 'pip3',
}
