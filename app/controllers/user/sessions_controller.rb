class User::SessionsController < Devise::SessionsController
	# Override to match success style of PNotice message
	def set_flash_message(key, kind, options = {})
		case key
			when :notice
        	    key = :success
        end
        super key, kind, options
	end
	def set_flash_message!(key, kind, options = {})
		case key
			when :notice
        	    key = :success
        end
        super key, kind, options
	end
	# !Override to match success style of PNotice message
end