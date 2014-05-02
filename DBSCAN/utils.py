import matplotlib.pyplot as plt
from Point import Point 
import math

colors = ['b', 'g', 'r', 'c', 'm', 'y', 'k']

def visualize(points):
    """points: list of point
    draw the list of points
    numOfCluster is the total number of cluster that the dataset has
    cluster = 0 means noise
    1..(numOfCluster - 1) is the number of cluster returned by DBSCAN"""
    for point in points:
        plt.plot(point.x, point.y, colors[point.cluster] + 'o')
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
