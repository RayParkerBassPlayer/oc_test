# A helper to print things out nicely.
def print_feedback(message = "", options = {:banner_char => "-"})
  banner = options[:banner_char] * 80

  puts banner
  message.empty? ? puts("\n") : puts(message + "\n")

  if block_given?
    yield
    puts "\n...done."
  end

  puts banner + "\n\n"
end


# Only allow seeding from environments deemed safe for such drastic action.
allowed_environments = %W[test development]

if !allowed_environments.include?(Rails.env)
  print_feedback("Seeding only allowed in #{allowed_environments.to_sentence} environments.", :banner_char => "!")
  abort
end

# Use the proper creds for this environment.
db_config = Rails.configuration.database_configuration[Rails.env].symbolize_keys

print_feedback("Bulk loading files into #{db_config[:database]} as #{db_config[:username]}:#{db_config[:password] || "nil"} (#{Rails.env} environment)", :banner_char => "#")

# Load all of the SQL dump files in /db/seeds
# Uses the database configuration for settings
# Of course, requires the MySQL command line client to be installed.

print_feedback("Loading seeds...") do
  # This more traditional way of loading the db was failing because of BLOB fields in the data
  # and the way ActiveRecord chokes on these sorts of things, and huge files were problematic
  # as it required MySql configuration changes to get things to work.
  # Left here for reference.

  # Dir[File.join(Rails.root, 'db', 'seeds', '*.sql')].each do |sql_file|
  #   puts "Loading #{sql_file}..."
  #   ActiveRecord::Base.connection.execute(File.read(sql_file).strip)
  # end

  # Load all sql seeds using mysql command line util
  sql_files = Dir[File.join(Rails.root, 'db', 'seeds', '*.sql')]
  puts "\nLoading SQL seeds".upcase if sql_files.any?

  user_string = ''
  user_string += "--user='#{db_config[:username]}'" if db_config[:username].present?
  user_string += " --password='#{db_config[:password]}'" if db_config[:password].present?
  user_string += " --socket='#{db_config[:socket]}'" if db_config[:socket].present?
  user_string += " --port='#{db_config[:port]}'" if db_config[:port].present?
  user_string += " --host='#{db_config[:host]}'" if db_config[:host].present?

  sql_files.each do |sql_file|
    puts File.basename(sql_file)
    `mysql #{user_string} '#{db_config[:database]}' < #{sql_file}`
  end

  # Load all of the CSV dump files in /db/seeds
  # file names have to be the same name as the table/model.
  csv_files = Dir[File.join(Rails.root, 'db', 'seeds', '*.csv')]
  puts "\nLoading CSV seeds".upcase if csv_files.any?

  csv_files.each do |csv_file|
    puts File.basename(csv_file)
    klass = File.basename(csv_file, ".*").classify.constantize


    CSV.foreach(csv_file, {:headers => true, :header_converters => :symbol}) do |row|
      attributes = {}
      row.headers.each do |header|
        attributes[header] = row[header]
      end

      klass.new(attributes).save(:validate => false)
    end
  end

  # Run Ruby seeding scripts
  # Things not well represented in SQL dumps.  These get run after all of the data seed files
  # so that data dependencies are met before Ruby code runs.
  ruby_scripts = Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')]
  puts "\nLoading Ruby script seeds".upcase if ruby_scripts.any?

  ruby_scripts.sort.each do |seed|
    puts "ruby_scripts/#{File.basename(seed)}"
    load seed
  end
end
