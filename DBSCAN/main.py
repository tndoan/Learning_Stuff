import sys
import utils
from dbscan import *

if __name__ == "__main__":
    filename = sys.argv[1]
    points = utils.read_input(filename) 
    dbscan(points, 0.5) # it will labeled cluster of elements of points
    utils.visualize(points)
