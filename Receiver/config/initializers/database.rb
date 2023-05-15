ENV['ENV'] ||= 'development'

db_conf = YAML::load(File.open(File.join(Rails.root,'config','database.yml')))

DB1_CONF = db_conf["#{ENV['ENV']}".to_sym]
DB2_CONF = db_conf["#{ENV['ENV']}2".to_sym]