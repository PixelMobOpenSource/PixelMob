require 'rspec/core/formatters/documentation_formatter'
class AnxiousFormatter < RSpec::Core::Formatters::DocumentationFormatter
  def example_started(example)
    message = "- #{example.description}"
    output.puts message
    output.flush
  end
end
