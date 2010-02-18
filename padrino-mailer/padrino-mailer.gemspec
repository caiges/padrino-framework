# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{padrino-mailer}
  s.version = "0.8.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Padrino Team", "Nathan Esquenazi", "Davide D'Agostino", "Arthur Chiu"]
  s.date = %q{2010-02-18}
  s.description = %q{Mailer system for padrino allowing easy delivery of application emails}
  s.email = %q{padrinorb@gmail.com}
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "lib/padrino-mailer.rb",
     "lib/padrino-mailer/base.rb",
     "lib/padrino-mailer/delivery.rb",
     "lib/padrino-mailer/mail_object.rb",
     "padrino-mailer.gemspec",
     "test/fixtures/mailer_app/app.rb",
     "test/fixtures/mailer_app/views/demo_mailer/sample_mail.erb",
     "test/fixtures/mailer_app/views/sample_mailer/anniversary_message.erb",
     "test/fixtures/mailer_app/views/sample_mailer/birthday_message.erb",
     "test/helper.rb",
     "test/test_mail_object.rb",
     "test/test_mailer_base.rb",
     "test/test_padrino_mailer.rb"
  ]
  s.homepage = %q{http://github.com/padrino/padrino-framework/tree/master/padrino-mailer}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{padrino-mailer}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Mailer system for padrino}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<padrino-core>, ["= 0.8.5"])
      s.add_runtime_dependency(%q<tilt>, [">= 0.2"])
      s.add_runtime_dependency(%q<tmail>, [">= 1.2"])
      s.add_development_dependency(%q<shoulda>, [">= 2.10.3"])
      s.add_development_dependency(%q<haml>, [">= 2.2.1"])
      s.add_development_dependency(%q<mocha>, [">= 0.9.7"])
      s.add_development_dependency(%q<rack-test>, [">= 0.5.0"])
      s.add_development_dependency(%q<webrat>, [">= 0.5.1"])
    else
      s.add_dependency(%q<padrino-core>, ["= 0.8.5"])
      s.add_dependency(%q<tilt>, [">= 0.2"])
      s.add_dependency(%q<tmail>, [">= 1.2"])
      s.add_dependency(%q<shoulda>, [">= 2.10.3"])
      s.add_dependency(%q<haml>, [">= 2.2.1"])
      s.add_dependency(%q<mocha>, [">= 0.9.7"])
      s.add_dependency(%q<rack-test>, [">= 0.5.0"])
      s.add_dependency(%q<webrat>, [">= 0.5.1"])
    end
  else
    s.add_dependency(%q<padrino-core>, ["= 0.8.5"])
    s.add_dependency(%q<tilt>, [">= 0.2"])
    s.add_dependency(%q<tmail>, [">= 1.2"])
    s.add_dependency(%q<shoulda>, [">= 2.10.3"])
    s.add_dependency(%q<haml>, [">= 2.2.1"])
    s.add_dependency(%q<mocha>, [">= 0.9.7"])
    s.add_dependency(%q<rack-test>, [">= 0.5.0"])
    s.add_dependency(%q<webrat>, [">= 0.5.1"])
  end
end

