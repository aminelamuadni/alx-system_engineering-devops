# This manifest ensures that a specific version of Flask is installed

package { 'flask':
  ensure   => '2.1.0',
  provider => 'pip3',
}
