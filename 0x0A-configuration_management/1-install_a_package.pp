# This manifest ensures that a specific version of Flask is installed

# Package resource type is used to manage software packages
package { 'Flask':
  ensure   => '2.1.0',         # Ensure Flask version 2.1.0 is installed
  provider => 'pip3',          # Specify pip3 as the package provider
}
