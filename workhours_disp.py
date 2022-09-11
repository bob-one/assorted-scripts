#!/usr/bin/env python3
import sys
import argparse
import re
from rich.console import Console
from rich.table import Table
from rich import print as rprint
from datetime import datetime

console = Console()
table = Table()

sumTime = []
listArray = []
index = 1

parser = argparse.ArgumentParser('get file')
parser.add_argument('-f', '--file', type = str, default = "")
args = parser.parse_args()

table = Table(show_header = True, header_style = "bold magenta")
table.add_column("Date", style = "dim yellow", width = 12)
table.add_column("Time In", style = "green")
table.add_column("Time Out", style = "cyan")
table.add_column("Accumulated", style = "blue")

with open(args.file) as work_hours:
    listArray = work_hours.readlines()

sumTime = '23:59:59'

for element in range(len(listArray)):
    splitArray = [ listArray[element] ]
    splitString = str(splitArray)
    date = (str(splitString[5:7]) + "." + str(splitString[8:10]) + "." + str(splitString[11:13]))
    timeout = (str(splitString[14:16]) + ":" + str(splitString[17:19]) + ":" + str(splitString[20:22]))
    
    if ( index % 2 ) == 0:
        s1 = timein
        s2 = timeout
        format = "%H:%M:%S"
        totaltime = datetime.strptime(str(s2), format) - datetime.strptime(str(s1), format)
        table.add_row(date, timein, timeout, str(totaltime))
        sumTime = datetime.strptime(str(sumTime), format) - datetime.strptime(str(totaltime), format)
    else:
        timein = timeout

    index += 1

totalsumTime = datetime.strptime('23:59:59', format) - datetime.strptime(str(sumTime), format)
table.add_row("Total Time", "", "", str(totalsumTime))
rprint(f"[green] Rønn[blue]ing[green] Control[/green]")
console.print(table)
