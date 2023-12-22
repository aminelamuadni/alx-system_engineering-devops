#!/usr/bin/pup
# This manifest ensures that a specific version of Flask is installed

# Package resource type is used to manage software packages
package { 'flask':
  ensure   => '2.1.0',
  provider => 'pip3',
}
