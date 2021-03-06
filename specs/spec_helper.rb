require 'time'
require 'simplecov'
require 'minitest'
require 'minitest/autorun'
require 'minitest/reporters'
SimpleCov.start

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

# Require_relative your lib files here!
require_relative '../lib/driver'
require_relative '../lib/passenger'
require_relative '../lib/trip'
require_relative '../lib/trip_dispatcher'
