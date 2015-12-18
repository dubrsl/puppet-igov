
require 'yaml'

environment = `git rev-parse --abbrev-ref HEAD`
environment = environment.chomp
config = YAML.load_file('deploy.yaml')
pm = config['dev']['puppetmaster']
base_dir = config['dev']['base_path']


namespace :deploy do
  desc "deploy code to development environment"
  task :dev do
    sync_cmd = "rsync -azP --no-o --no-g --exclude '.*' --exclude '.gitignore' --delete ./ #{pm}:#{base_dir}/#{environment}/"
    system( sync_cmd )
  end
end

namespace :update do
  task :modules do
    sync_cmd = "rsync -azP --no-o --no-g --exclude '.gitignore' #{pm}:#{base_dir}/#{environment}/modules ./modules/ "
    system( sync_cmd )
    # puts sync_cmd
  end
end
