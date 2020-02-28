import math
import random

class Guassian:
    '''
    Class which can be used to generate Guassian distributions
    '''

    def __init__(self, mean, stddev):
        '''
        Initialize with the following
        mean: Mean value to generate around
        stddev: Standard deviation for random generation
        rand_helper: Function to generate the random seed
        '''
        self.mean = float(mean)
        self.stddev = float(stddev)
        self.valid = False
        self.next = float(0)

    def rand(self):
        if self.valid:
            self.valid = False
            return self.next
        self.valid = True
        x, y = self.guassian(self.mean, self.stddev)
        next = y
        return x

    @staticmethod
    def guassian(mean, stddev):
        theta = 2 * math.pi * random.random()
        rho = math.sqrt(-2 * math.log10(1 - random.random()))
        scale = stddev * rho
        x = mean + scale * math.cos(theta)
        y = mean + scale * math.sin(theta)
        return x, y
