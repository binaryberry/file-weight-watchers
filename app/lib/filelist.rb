require 'rest_client'
require 'json'
require 'pry'

class FileList

	attr_accessor :files_weight
	attr_reader :files_metadata

	def initialize(metadata)
		@files_metadata = metadata
		@files_weight = 0
	end

	def total_weight
		@files_list_metadata = JSON.parse(self.files_metadata)
		@files_list_metadata["files"].each do |file_metadata|
			@files_weight += file_metadata["size"]
		end
		@files_weight
	end
end