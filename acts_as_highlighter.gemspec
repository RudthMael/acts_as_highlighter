$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "acts_as_highlighter/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "acts_as_highlighter"
  s.version     = ActsAsHighlighter::VERSION
  s.authors     = ["Konstantin Ivanov"]
  s.email       = ["ivanov.konstantin@logrus.org.ru"]
  s.homepage    = "http://www.github.com/logrusorgru/acts_as_highlighter"
  s.summary     = "Syntax Highlighter by AlexGorbatchev <https://github.com/alexgorbatchev/SyntaxHighlighter>"
  s.description = "rails not tested plugin"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.13"

  s.add_development_dependency "sqlite3"
end
