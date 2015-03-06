#require 'orm_adapter/adapters/dynamoid'
require 'dynamoid/document'

Dynamoid::Document::ClassMethods.send :include, Devise::Models

