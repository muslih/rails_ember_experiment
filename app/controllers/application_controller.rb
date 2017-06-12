class ApplicationController < ActionController::API

	def relationship_params
		associations = {}
		params[:data][:relationships].each do |key, value|
		# params[:relationships].each do |key, value|
			associations[key.to_sym] = if value.is_a? Array
				value.map { |data| find_related_object(data) }
			else
				find_related_object(value)
			end
		end
		associations
	end

	private
	def find_related_object(data)
		# "contacts" -> "contact" -> "Contact" -> Contact
		data[:type].singularize.titlecase.constantize.find(data[:id])
	end
end

