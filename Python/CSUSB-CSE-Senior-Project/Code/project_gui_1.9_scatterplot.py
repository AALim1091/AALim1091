# -*- coding: utf-8 -*-
"""
Created on Mon Jun  1 13:30:30 2020

@author: joshu
"""
import tkinter as tk   # python3
from PIL import ImageTk, Image
import matplotlib
matplotlib.use("TkAgg")
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg
from matplotlib.backends.backend_qt4agg import NavigationToolbar2QT
from matplotlib.figure import Figure
import matplotlib.animation as animation
from matplotlib import style

img1 = Image.open('foot3.png')
img2 = Image.open('TaiChi.png')
LastName = " "
FirstName = " "


f = Figure(figsize=(5,4), dpi=100)
a = f.add_subplot(111)

def animate(i):
    xList = [1,2,3,4,5]
    yList = [1,2,3,4,5]
    size = [10,20,30,40,50]
    a.scatter(xList, yList, s = size)

class SampleApp(tk.Frame):
    def __init__(self, parent, *args, **kwargs):
        tk.Frame.__init__(self, parent, *args, **kwargs) 
        container = tk.Frame(parent)
        container.pack(side="top", fill="both", expand=True)
        container.grid_rowconfigure(0, weight=1)
        container.grid_columnconfigure(0, weight=1)
        self.foot = ImageTk.PhotoImage(img1)
        self.frames = {}
        for F in (StartPage, DevelopersPage, GateInfoPage, BalanceInfoPage, GateTestPage, BalanceTestPage):
            page_name = F.__name__
            frame = F(parent=container, controller=self)
            self.frames[page_name] = frame
            frame.grid(row=0, column=0, sticky="nsew")
        self.show_frame("StartPage")
    def show_frame(self, page_name):
        frame = self.frames[page_name]
        frame.tkraise()
    def SaveInfo(self, param2,param3,param4,param5,param6,page_name):
        global FirstName
        global LastName
        global Weight
        global Height
        global Gender
        FirstName = param2
        LastName = param3
        Weight = param4
        Height = param5
        frame = self.frames[page_name]
        frame.tkraise()
        
class StartPage(tk.Frame):
    def __init__(self, parent, controller):
        tk.Frame.__init__(self, parent)
        self.controller = controller
        filename = tk.PhotoImage(file = "TaiChi.png")
        label = tk.Label(self, text="Tai Chi Balance Mat") # Added
        label.pack()
        label = tk.Label(self, text=" ") # Added
        label.pack()
        label = tk.Label(self, text=" ") # Added
        label.pack()
        label = tk.Label(self, text=" ") # Added
        label.pack()
        button1 = tk.Button(self, text="View Developers", command=lambda: controller.show_frame("DevelopersPage"))
        button2 = tk.Button(self, text="Gate Testing", command=lambda: controller.show_frame("GateInfoPage"))
        button3 = tk.Button(self, text="Balance Testing", command=lambda: controller.show_frame("BalanceInfoPage"))
        button1.pack()
        button2.pack()
        button3.pack()

class DevelopersPage(tk.Frame):
    def __init__(self, parent, controller):
        tk.Frame.__init__(self, parent)
        self.controller = controller
        label = tk.Label(self, text="Developers") # Added
        label.pack()
        label = tk.Label(self, text=" ") # Added
        label.pack()
        label = tk.Label(self, text="Riley Sherwood") # Added
        label.pack()
        label = tk.Label(self, text="Joshua Gogolin") # Added
        label.pack()
        label = tk.Label(self, text="Aarom Lim") # Added
        label.pack()
        label = tk.Label(self, text="Scott Murray") # Added
        label.pack()
        button = tk.Button(self, text="Go to the start page", command=lambda: controller.show_frame("StartPage"))
        button.pack()

class GateInfoPage(tk.Frame):
    def __init__(self, parent, controller):
        tk.Frame.__init__(self, parent)
        self.controller = controller
        e1 = tk.Entry(self)
        e2 = tk.Entry(self)
        e3 = tk.Entry(self)
        e4 = tk.Entry(self)
        e5 = tk.Entry(self)
        label = tk.Label(self, text="Gate Info Page") # Added
        label.pack()
        label = tk.Label(self, text=" ") # Added
        label.pack()
        label = tk.Label(self, text="First Name") # Added
        label.pack()
        e1.pack()
        label = tk.Label(self, text="Last Name") # Added
        label.pack()
        e2.pack()
        label = tk.Label(self, text="Weight") # Added
        label.pack()
        e3.pack()
        label = tk.Label(self, text="Height") # Added
        label.pack()
        e4.pack()
        label = tk.Label(self, text="Gender") # Added
        label.pack()
        e5.pack()
        label = tk.Label(self, text=" ") # Added
        label.pack()
        button2 = tk.Button(self, text="Press to save",command=lambda: controller.SaveInfo(e1.get(),e2.get(),e3.get(),e4.get(),e5.get(),("GateTestPage")))
        button2.pack()
        
        
class BalanceInfoPage(tk.Frame):
    def __init__(self, parent, controller):
        tk.Frame.__init__(self, parent)
        self.controller = controller
        e1 = tk.Entry(self)
        e2 = tk.Entry(self)
        e3 = tk.Entry(self)
        e4 = tk.Entry(self)
        e5 = tk.Entry(self)
        label = tk.Label(self, text="Gate Info Page") # Added
        label.pack()
        label = tk.Label(self, text=" ") # Added
        label.pack()
        label = tk.Label(self, text="First Name") # Added
        label.pack()
        e1.pack()
        label = tk.Label(self, text="Last Name") # Added
        label.pack()
        e2.pack()
        label = tk.Label(self, text="Weight") # Added
        label.pack()
        e3.pack()
        label = tk.Label(self, text="Height") # Added
        label.pack()
        e4.pack()
        label = tk.Label(self, text="Gender") # Added
        label.pack()
        e5.pack()
        label = tk.Label(self, text=" ") # Added
        label.pack()
        button2 = tk.Button(self, text="Press to save",command=lambda: controller.SaveInfo(e1.get(),e2.get(),e3.get(),e4.get(),e5.get(),("BalanceTestPage")))
        button2.pack()

class GateTestPage(tk.Frame):
    def __init__(self, parent, controller):
        tk.Frame.__init__(self, parent)
        self.controller = controller
        label = tk.Label(self, text="Gate Test Page") # Added
        label.pack(side="top", fill="x", pady=10)
        button = tk.Button(self, text="Go to the start page",command=lambda: controller.show_frame("StartPage"))
        button.pack()
        canvas = FigureCanvasTkAgg(f, self)
        canvas.get_tk_widget().pack(side=tk.BOTTOM, fill=tk.BOTH, expand=True)


class BalanceTestPage(tk.Frame):
    def __init__(self, parent, controller):
        tk.Frame.__init__(self, parent)
        self.controller = controller
        label = tk.Label(self, text="Balance Test Page") # Added
        label.pack()
        label = tk.Label(self, image = self.controller.foot)
        label.pack()
        button = tk.Button(self, text="Go to the start page",command=lambda: controller.show_frame("StartPage"))
        button.pack()

if __name__ == "__main__":
    root = tk.Tk() #Added
    app = SampleApp(root) #added root
    ani = animation.FuncAnimation(f, animate, interval=100)
    root.mainloop()

print(FirstName)
print(LastName)