import matplotlib.pyplot as plt
from Point import Point 
import math

def visualize(points):
    """points: list of point
    draw the list of points"""
    list_x = list()
    list_y = list()
    for point in points:
        list_x.append(point.x)
        list_y.append(point.y)
    plt.plot(list_x, list_y, 'o') #TODO need to improve the visualization
    plt.show()

def read_input(filename):
    """filename: name of input file
    return the list of points which could be parsed from file"""
    points = list()
    f = open(filename, 'r')
    lines = f.readlines()
    for line in lines:
        components = (line.strip('\n')).split(' ')
        x = float(components[0])
        y = float(components[1])
        p = Point(x, y)
        points.append(p)
    return points

def distance(p1, p2):
    """return the distance between 2 points"""
    return math.sqrt((p1.x - p2.x) * (p1.x - p2.x) + (p1.y - p2.y)* (p1.y - p2.y))
