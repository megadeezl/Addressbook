require 'fileutils'
require 'yaml'
require 'erb'
require 'pp'

# To get makepkg to run this rake task you have to set
# run_post_build_rake: true in the project.yaml file.

task :default => ["pre_build_hook"]              # Default spec for rake on the command line.

desc "Pre Build Rake Task For makepkg"
task :pre_build_hook => ["generate_files_from_erb_templates"]     # Default spec for makepkg

desc "Create files from erb templates that will be used my makepkg when creating the rpm."
task :generate_files_from_erb_templates do
  begin
    # Get data from project.yaml
    trunk = File.expand_path("#{File.dirname(__FILE__)}/../../")
    @config = YAML.load_file("#{trunk}/project.yaml")
    puts "     Creating rpm template files."
    template_dir = @testing_folder = File.expand_path("#{File.dirname(__FILE__)}/../templates/rpm")
    Dir.glob("#{template_dir}/*.erb").each do |erb_file|
      next if erb_file.end_with? "rpm-spec.erb"

      rpm_template_file = erb_file[0..-5]
      template = ERB.new(File.read erb_file)
      File.open(rpm_template_file, 'w') {|f| f.write(template.result(binding)) }
      puts "        Created: #{rpm_template_file.split('/').last}, Removing its erb."
      FileUtils.rm_f erb_file
    end
  rescue LoadError => error
    puts "ERROR!: Error creating rpm event files!  The RPM will be broken!!: #{error.message}"
    exit 1
  end
end
