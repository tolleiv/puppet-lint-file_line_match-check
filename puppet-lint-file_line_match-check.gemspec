Gem::Specification.new do |spec|
  spec.name        = 'puppet-lint-file_line_match-check'
  spec.version     = '1.0.0'
  spec.homepage    = 'https://github.com/tolleiv/puppet-lint-file_line_match-check'
  spec.license     = 'MIT'
  spec.author      = 'Tolleiv Nietsch'
  spec.email       = 'tolleiv.nietsch@aoe.com'
  spec.files       = Dir[
    'README.md',
    'LICENSE',
    'lib/**/*',
    'spec/**/*',
  ]
  spec.test_files  = Dir['spec/**/*']
  spec.summary     = 'A puppet-lint plugin to check whether all file_line resources have a match condition.'
  spec.description = <<-EOF
    A puppet-lint plugin to check whether all file_line resources have a match condition.
    That's important to avoid that file_line screws up the file-content.
  EOF

  spec.add_dependency             'puppet-lint', '~> 1.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rspec-its', '~> 1.0'
  spec.add_development_dependency 'rspec-collection_matchers', '~> 1.0'
  spec.add_development_dependency 'rake'
end
