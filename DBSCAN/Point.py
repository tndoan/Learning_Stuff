

class Point():
    def __init__(self, x, y, cluster=-1, color=None):
        self.x = x
        self.y = y
        self.cluster = cluster # cluster=-1 means unclassified point
        self.color = color
