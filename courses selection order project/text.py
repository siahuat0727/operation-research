import matplotlib.pyplot as plt

textstr = 'blabla' 
plt.xlim(0, 5)
plt.ylim(5, 0)
# print textstr
plt.text(-2, 1, textstr, fontsize=14)
plt.grid(True)
plt.subplots_adjust(left=0.5)
plt.show()
