Rails.application.configure do
    config.serviceworker.routes do
      # ...
  
      match "manifest.json"
    end
  end