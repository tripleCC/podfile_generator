require "podfile_generator/version"
require "optparse"
require 'podfile_generator/generator'

module PodfileGenerator
	options = {}

	OptionParser.new do |opts|
		opts.banner = "podfile generator 可以在发布阶段，根据 PodfileTemplate 和已知 Podfile 文件生成新的 Podfile"

		opts.on('-p PATH', '--podfile PATH', 'podfile path') do |value|
			options[:podfile] = value
		end

		opts.on('-t PATH', '--podfile-template PATH', 'podfile template') do |value|
			options[:podfile_template] = value
		end	

		opts.on('-l LABEL', '--label LABEL', 'label to be replaced') do |value|
			options[:label] = value
		end				
	end.parse!

	generator = Generator.new(options[:podfile], options[:podfile_template], options[:label])
	generator.generate!

	exit
end
