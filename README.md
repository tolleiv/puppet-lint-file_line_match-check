# Puppet lint check for file_line resources

[![Build Status](https://travis-ci.org/tolleiv/puppet-lint-file_line_match-check.png?branch=master)](https://travis-ci.org/tolleiv/puppet-lint-file_line_match-check)

We found that using file\_line without a match attrbite is dangerous in our setup.
Therefore this check implements a warning in case the match is missing.

