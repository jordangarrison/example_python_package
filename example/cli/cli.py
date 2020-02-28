from example.lib.guassian import Guassian
import argparse

def guass():
    parser = argparse.ArgumentParser()
    parser.add_argument('-m', '--mean', default=1, help='Set the mean value')
    parser.add_argument('-s', '--stddev', default=0.1, help='Set the standard deviation')
    args = parser.parse_args()

    argument_dict = vars(args)

    g = Guassian(argument_dict['mean'], argument_dict['stddev'])
    print(g.rand())
