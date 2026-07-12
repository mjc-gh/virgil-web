RubyLLM.configure do |config|
  config.anthropic_api_key = ENV["ANTHROPIC_API_KEY"] if ENV["ANTHROPIC_API_KEY"].present?
  config.openrouter_api_key = ENV["OPENROUTER_API_KEY"] if ENV["OPENROUTER_API_KEY"].present?

  # Use the association-based acts_as API (recommended)
  config.use_new_acts_as = true
end
