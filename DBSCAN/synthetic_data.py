import random
import math

def generate_synthetic(numNode, r1, r2, r3, center, filename):
    """generate some nodes inside the circle whose r1 is the radius
    the second cluster is in the annulus between 2 circles whose radius are 
    r2 and r3. r1 < r2 < r3
    center is the center for three circles. It is the float tuple
    the generated nodes will be recorded to filename"""
    result = list()
    for i in range(numNode):
        point = generate_point(center, 0.0, r1)
        result.append(point)
    for i in range(2 * numNode):
        point = generate_point(center, r2, r3)
        result.append(point)
    writeToFile(result, filename)

def generate_point(center, lBound, uBound):
    """generate point whose distance from the center is between 
    lBound and uBound
    return the pair of point"""
    radius = random.uniform(lBound, uBound)
    angle = random.uniform(0.0, 2.0 * math.pi)
    dx = radius * math.cos(angle)
    dy = radius * math.sin(angle)
    return (center[0] + dx, center[1] + dy)

def writeToFile(listOfTuple, filename):
    """write the list of tuples to the filename
    each element of tuple has 2 elements only"""
    f = open(filename, 'w')
    for t in listOfTuple:
        f.write(str(t[0]) + ' ' + str(t[1]) +'\n')
    f.close()
