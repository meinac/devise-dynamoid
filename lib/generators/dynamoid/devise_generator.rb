require 'rails/generators'
require 'rails/generators/named_base'
require 'generators/devise/orm_helpers'

module Dynamoid
  module Generators
    class DeviseGenerator < Rails::Generators::NamedBase
      #include Devise::Generators::OrmHelpers

      def generate_model
        invoke "dynamoid:document", [name] unless model_exists? && behavior == :invoke
      end

      def inject_devise_content
        inject_into_file model_path, model_contents, :after => "include Dynamoid::Document\n"
      end

      def replace_default_devise_orm
        gsub_file Rails.root.join("config/initializers/devise.rb"), 'orm/active_record', 'orm/dynamoid'
      end

      def model_contents
        buffer = <<-CONTENT
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable
CONTENT
        buffer += <<-CONTENT if needs_attr_accessible?
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
CONTENT
        buffer
      end

      def needs_attr_accessible?
        rails_3? && !strong_parameters_enabled?
      end

      def rails_3?
        Rails::VERSION::MAJOR == 3
      end

      def strong_parameters_enabled?
        defined?(ActionController::StrongParameters)
      end

      private

      def model_exists?
        File.exists?(File.join(destination_root, model_path))
      end

      def migration_exists?(table_name)
        Dir.glob("#{File.join(destination_root, migration_path)}/[0-9]*_*.rb").grep(/\d+_add_devise_to_#{table_name}.rb$/).first
      end

      def migration_path
        @migration_path ||= File.join("db", "migrate")
      end

      def model_path
        @model_path ||= File.join("app", "models", "#{file_path}.rb")
      end
    end
  end
end
