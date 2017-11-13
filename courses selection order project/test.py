def outer():  
	def inner():  
		print('Inside inner')
	return inner # 1  

foo = outer()()
