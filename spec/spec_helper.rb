require "bundler/setup"
require "markdown_media"
require "source_code"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  def strip_html_whitespace(html)
    html.strip.gsub(/\n/, "").
               gsub(/>\s*/, ">").
               gsub(/\s*</, "<")
  end
end
