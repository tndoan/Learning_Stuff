import utils

def k_dist(points, k):
    """input is the list of nodes from input file
    return list of distance in k-dist of each point"""
    if k > len(points):
        return None # it is out of scope
    # get all distance of nodes
    distance = getAllDistance(points) 
    result = list()
    for element in distance:
        result.append(element[k])
    result.sort(reversed=True) # sort decendingly
    return result

def getAllDistance(points):
    """input is the list of points
    return the list which contains all distance from this node"""
    distance = list()
    for i in range(len(points)):
        list_distance = list()
        for j in range(len(points)):
            if i != j:
                dist = utils.distance(points[i], points[j])
                list_distance.append(dist)
        list_distance.sort(reversed= True) # sort decendingly
        distance.append(list_distance)
    return distance

def dbscan(points, eps, minPts=4):
    """DBSCAN clusters points by using 2 paramenters
    eps: distance to indicate neighborhood.
    minPts: min points to define the cluster. Default value is 4
    return points which have been labeled"""
    clusterId = 1 # cluster id = 0 is for noise only
    for i in range(len(points)):
        point = points[i]
        if point.cluster == None: # if the point is not assigned to any cluster
            if expandCluster(points, i, clusterId, eps, minPts):
                clusterId += 1

def getNeighbor(points, p, eps):
    """return list of neighbor within eps distance of point in points set"""
    result = list()
    point = points[p]
    for i in range(len(points)):
        if i != p: # two points are not identical
            cPoint = points[i] # current considerred point
            dist = utils.distance(point, cPoint)
            if dist < eps:
                result.append(cPoint)
    return result

def expandCluster(points, p, clusterId, eps, minPts):
    """p is the index of current considering point in points list"""
    seeds = getNeighbor(points, p, eps)
    if len(seeds) < minPts:
        points[p].cluster = 0
        return False
    else:
        # TODO: continue filling in the void here
        while len(seeds) > 0:
            print "abc"
        return True
