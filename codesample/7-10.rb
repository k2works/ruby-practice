class EvalTarget
   def initialize
	  @instance_val = 'instance valiable'
   end

   def instance_binding
	  local_val = 'local valiable' # !> assigned but unused variable - local_val
	  binding
   end

   private
   def private_method
	  'private method'
   end
end

e1 = EvalTarget.new
binding_obj = e1.instance_binding

eval "@instance_val", binding_obj
eval "local_val", binding_obj
eval "private_method", binding_obj
