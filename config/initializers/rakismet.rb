Stage::Application.config.rakismet.test = false
Stage::Application.config.rakismet.key = Rails.application.credentials.akismet_api_key
Stage::Application.config.rakismet.url = 'http://localhost:5000/'
