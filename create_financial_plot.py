#!/usr/bin/env python3

import matplotlib.pyplot as plt
import numpy as np
import argparse

parser = argparse.ArgumentParser('pie maker')
parser.add_argument('-b', '--bills', type = int, default = 0)
parser.add_argument('-f', '--food', type = int, default = 0)
parser.add_argument('-c', '--clothes', type = int, default = 0)
parser.add_argument('-l', '--luxoury', type = int, default = 0)
parser.add_argument('-s', '--subscription', type = int, default = 0)
parser.add_argument('-t', '--tobacco', type = int, default = 0)
args = parser.parse_args()

def createPlot(b = 0, c = 0, f = 0, l = 0, s = 0, t = 0):
    y = np.array([b, c, f, l, s, t])
    mylabels = [f"Bills {b}", f"Clothes {c}", f"Food {f}", f"Luxoury {l}", f"Subscriptions {s}", f"Snus {t}"]

    plt.pie(y, labels = mylabels)
    plt.savefig('/home/andre/Documents/Finance/plot/pie.png')

if __name__ == "__main__":
    b = abs(args.bills)
    c = abs(args.clothes)
    f = abs(args.food)
    l = abs(args.luxoury)
    s = abs(args.subscription)
    t = abs(args.tobacco)
    createPlot(b, c, f, l, s, t)
    
