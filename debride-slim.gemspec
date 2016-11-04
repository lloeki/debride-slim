Gem::Specification.new do |s|
  s.name        = 'debride-slim'
  s.version     = '1.0.0'
  s.licenses    = ['3BSD']
  s.summary     = 'Extends debride to analyze Slim files'
  s.authors     = ['Loic Nageleisen']
  s.email       = 'loic.nageleisen@gmail.com'
  s.files       = Dir['lib/**/*.rb']
  s.homepage    = 'https://github.com/lloeki/debride-slim'

  s.add_dependency 'debride', '~> 1.6'
  s.add_dependency 'slim'

  s.add_development_dependency 'rake', '~> 11.3.0'
  s.add_development_dependency 'pry', '~> 0.10'
  s.add_development_dependency 'rubocop', '~> 0.43.0'
  s.add_development_dependency 'minitest', '~> 5.9.1'
end
