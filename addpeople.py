from tkinter import *
from tkinter import messagebox
import sqlite3

conn = sqlite3.connect('database.db')
cur = conn.cursor()

class AddPeople(Toplevel):
	def __init__(self):
		Toplevel.__init__(self)
		# self.geometry('650x750+550+200')
		self.geometry('650x750+350+5')
		self.title('Add People')
		self.resizable(False, False)

		#Frames

		self.top = Frame(self, height = 150, bg = 'White')
		self.top.pack(fill = X)

		self.bottomFrame = Frame(self, height = 600, bg = '#fcc324')
		self.bottomFrame.pack(fill = X)

		#Heading, Image and Date

		self.top_image = PhotoImage(file = 'icons/addperson.png')
		self.top_image_lbl = Label(self.top, image = self.top_image, bg = 'White')
		self.top_image_lbl.place(x = 120, y = 10)

		self.heading = Label(self.top, text = 'My Persons', font = 'Arial 15 bold',
			fg = '#003f8a', bg = 'White')
		self.heading.place(x = 260, y = 60)

		#Labels and Entries

		#First Name

		self.lbl_name = Label(self.bottomFrame, text = 'First Name', font = 'Arial 15 bold', fg = 'White', bg = '#fcc324')
		self.lbl_name.place(x = 40, y = 40)

		self.ent_name = Entry(self.bottomFrame, width = 30, bd = 4)
		self.ent_name.insert(0, 'Please enter a First Name')
		self.ent_name.place(x = 150, y = 45)

		#Last Name

		self.lbl_surname = Label(self.bottomFrame, text = 'Last Name', font = 'Arial 15 bold', fg = 'White', bg = '#fcc324')
		self.lbl_surname.place(x = 40, y = 80)

		self.ent_surname = Entry(self.bottomFrame, width = 30, bd = 4)
		self.ent_surname.insert(0, 'Please enter a Last Name')
		self.ent_surname.place(x = 150, y = 85)

		#Email

		self.lbl_email = Label(self.bottomFrame, text = 'Email', font = 'Arial 15 bold', fg = 'White', bg = '#fcc324')
		self.lbl_email.place(x = 40, y = 120)

		self.ent_email = Entry(self.bottomFrame, width = 30, bd = 4)
		self.ent_email.insert(0, 'Please enter an Email')
		self.ent_email.place(x = 150, y = 125)

		#Phone Number

		self.lbl_phone = Label(self.bottomFrame, text = 'Phone', font = 'Arial 15 bold', fg = 'White', bg = '#fcc324')
		self.lbl_phone.place(x = 40, y = 160)

		self.ent_phone = Entry(self.bottomFrame, width = 30, bd = 4)
		self.ent_phone.insert(0, 'Please enter a Phone Number')
		self.ent_phone.place(x = 150, y = 165)

		#Address

		self.lbl_address = Label(self.bottomFrame, text = 'Address', font = 'Arial 15 bold', fg = 'White', bg = '#fcc324')
		self.lbl_address.place(x = 40, y = 300)

		self.address = Text(self.bottomFrame, width = 23, height = 15, wrap = WORD)
		self.address.place(x = 150, y = 200)

		#Button

		button = Button(self.bottomFrame, text = 'Add Person', command = self.addPerson)
		button.place(x = 270, y = 460)
		# self.lift()

	def addPerson(self):
		name = self.ent_name.get()
		surname = self.ent_surname.get()
		email = self.ent_email.get()
		phone = self.ent_phone.get()
		addr = self.address.get(1.0, 'end-1c')

		if (name and surname and email and phone and addr != ''):
			try:
				query = "INSERT INTO 'persons' (person_name, person_surname, person_email, person_phone, person_address) VALUES (?, ?, ?, ?, ?)"
				cur.execute(query, (name, surname, email, phone, addr))
				conn.commit()
				messagebox.showinfo('Success', 'Successfully added to database!', icon = 'info')
			except:
				messagebox.showerror("Error", "Can't add to database", icon = 'warning')
		else:
			messagebox.showerror("Error", "Fields can't be empty", icon = 'warning')