from tkinter import *

class About:
	def __init__(self, root):
		self.root = root

		frame = Frame(root, bg = '#ffa500', width = 550, height = 550)
		frame.pack(fill = BOTH)

		text = Label(frame, text = 'This is our About us page, you can find more'
									'\ninformation about us here.'
									'\nThis Application was created for Educational Purposes'
									'\nand we have learned a lot', bg = '#ffa500', font = 'Arial 14 bold')
		text.place(x = 20, y = 50)

def main():
	root = Tk()
	app = About(root)
	root.title('About us')
	# root.geometry('550x550+550+200')
	root.geometry('550x550+200+70')
	root.resizable(False, False)
	root.mainloop()

if __name__ == '__main__':
	main()