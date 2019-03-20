lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name = 'fluent-plugin-teams'
  spec.version = '1.0.1'
  spec.authors = ['nyamairi']
  spec.email = ['n.yamairi@gmail.com']

  spec.summary = 'fluentd output plugin for post to teams'
  spec.description = 'fluentd output plugin for post to teams'
  spec.homepage = 'https://github.com/nyamairi/fluent-plugin-teams'
  spec.license = 'MIT'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f|
      f.match(%r{^(test|spec|features)/})
    }
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'fluentd', ['>= 0.12', '< 2']
  spec.add_dependency 'rest-client'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'test-unit'
end
