Rails.application.routes.draw do
  post '/', to: 'bot#hook'
end
