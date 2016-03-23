using Prestashop::Mapper::Refinement
module Prestashop
  	module Mapper
    	class OrderHistory < Model
      		resource :order_histories
      		model :order_history

			attr_accessor :id, :id_order_state, :id_order, :id_employee

		    def initialize args = {}
		        @id               = args[:id]
		        @id_order_state     = args[:id_order_state]
		        @id_order          = args[:id_order]
		        @id_employee	= args[:id_employee]
		    end

		    # Hash is used as default source for #create
		    def hash
		    	order_history = {
		        	id_order_state: id_order_state, 
		        	id_order: id_order, 
		        	id_employee: id_employee 
		        }
		    end

		    # Find or create supplier from hash
		    def find_or_create
		        order_history = self.class.find_by 'filter[id]' => id
		        order_history ? order_history : create[:id]
		    end
	
	    end
  	end
end




      