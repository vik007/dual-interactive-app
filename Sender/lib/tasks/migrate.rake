desc "Migrate the database through scripts in db/migrate."
namespace :db do
  task :migrate do
    Rake::Task["db:migrate_db1"].invoke
    Rake::Task["db:migrate_db2"].invoke
  end

  task :migrate_db1 do
    ActiveRecord::Base.establish_connection :development
    ActiveRecord::Migrator.migrate("db/migrate")
    # ActiveRecord::MigrationContext.new("db/migrate/").migrate

  end

  task :migrate_db2 do
    ActiveRecord::Base.establish_connection :development2
    ActiveRecord::Migrator.migrate("db/second_migrate")
    # ActiveRecord::MigrationContext.new("db/second_migrate/").migrate
  end
end
