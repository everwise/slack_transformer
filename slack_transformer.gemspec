Gem::Specification.new do |s|
  s.name = 'slack_transformer'
  s.version = '1.0.3'
  s.license = 'MIT'
  s.summary = 'Transform HTML into Slack-ready mrkdwn and back'
  s.homepage = 'https://github.com/everwise/slack_transformer'
  s.authors = ['Eric Wang']
  s.email = ['eric@geteverwise.com']

  s.files = [
    'lib/slack_transformer.rb',
    *Dir['lib/slack_transformer/*.rb'],
    *Dir['lib/slack_transformer/html/*.rb'],
    *Dir['lib/slack_transformer/slack/*.rb']
  ]

  s.add_runtime_dependency 'nokogiri', '< 2.0'

  s.add_development_dependency 'rspec', '~> 3.7.0'
end
