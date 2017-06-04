# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

# Settings of StackProf
use StackProf::Middleware, enabled: true,
                           mode: :cpu,
                           raw: true,
                           interval: 1000,
                           save_every: 5

run Rails.application
