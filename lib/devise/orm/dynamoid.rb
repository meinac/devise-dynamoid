require 'orm_adapter/adapters/dynamoid'

MongoMapper::Document::ClassMethods.send :include, Devise::Models

