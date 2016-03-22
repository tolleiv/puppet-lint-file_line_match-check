# Puppet lint check for file_line resources

We found that using file\_line without a match attrbite is dangerous in our setup.
Therefore this check implements a warning in case the match is missing.

