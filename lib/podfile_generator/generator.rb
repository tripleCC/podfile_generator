require "podfile_generator/version"
require 'cocoapods-core'

module PodfileGenerator
	class Generator
		DEFAULT_LABEL = 'TRIPLECCREPLACEME'.freeze

		def initialize(podfile_path, podfile_template_path, label = nil) 
			raise "podfile path is required" unless podfile_path
			raise "podfile template path is required" unless podfile_template_path

			@podfile_path = podfile_path
			@podfile_template_path = podfile_template_path
			@label = label || DEFAULT_LABEL
		end

		def generate!
			raise "cant't find podfile at #{@podfile_path}" unless File.exist?(@podfile_path)
			raise "cant't find podfile template at #{@podfile_template_path}" unless File.exist?(@podfile_template_path)

			spec = ''
			podfile = Pod::Podfile.from_file(Pathname.new(@podfile_path))
			File.open(@podfile_template_path, 'r') do |file|
				file.each_line do |line|
					if line.strip.match(@label)
						podfile.dependencies.each do |dep|
							spec << "\tpod '#{dep.name}'"
							spec << ", '#{dep.requirement.to_s}'" unless dep.requirement.none?

							if dep.external? && dep.external_source[:branch]
								spec << ", '= #{dep.external_source[:branch].split('/').last}'" if dep.external_source[:branch].start_with?('release/')
							end

							spec << "\n"
						end
					else
						spec << line
					end
				end
			end

			File.open(@podfile_path, 'w') do |io|
				io << spec
			end

			spec
		end
	end
end
