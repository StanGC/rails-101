server "54.238.141.40", user: "apps", roles: %w{web app}, my_property: :my_value

role :app, %w{apps@54.238.141.40}
role :web, %w{apps@54.238.141.40}
role :db,  %w{apps@54.238.141.40}
