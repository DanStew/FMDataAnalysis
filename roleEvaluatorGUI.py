import tkinter as tk

#Making the window for the GUI
root = tk.Tk()
root.resizable(False,False)
root.title("Football Manager Player Analyser")
root.geometry("700x500")

#Making the main title of the GUI
titleRow1 = tk.Text(root,height = 2, width = 16, font=("Arial",24))
titleRow1.insert("1.0","Football Manager Player Analyser")
titleRow1.configure(state="disabled")
titleRow1.pack(anchor = "w", padx = 200, pady = 20)
titleRow2 = tk.Text(root,height = 2, width = 16, font=("Arial",24))
titleRow2.insert("1.0","Player Analyser")
titleRow2.configure(state="disabled")
titleRow2.pack(anchor = "w", padx = 200, pady = 40)

#Indefinitely running the function, until closed
root.mainloop()

"""
Some examples of buttons and placing items on a grid
btn_equals = tk.Button(root, text="=", command= lambda: evaluate_calculation(), width=5, font=("Arial,14"))
btn_openBracket = tk.Button(root, text="(", command= lambda: add_to_calculation("("), width=5, font=("Arial,14"))
btn_closeBracket = tk.Button(root, text=")", command= lambda: add_to_calculation(")"), width=5, font=("Arial,14"))
btn_clear = tk.Button(root, text="C", command=clear_field, width=5, font=("Arial, 14"))

#Positioning the buttons on the grid
btn_0.grid(row=5,column=1)
btn_1.grid(row=2,column=1)
btn_2.grid(row=2,column=2)
"""
