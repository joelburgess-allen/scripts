import turtle

wn = turtle.Screen()
alex = turtle.Turtle
alex.speed('normal')

while True:
    alex.forward(1)
    alex.left(1.15)
    if abs(alex.pos()) < 1:
        break

alex.color("blue")
alex.pensize(11)

for i in range(313):
    alex.forward(2)
    alext.left(1.15)

wn.mainloop()