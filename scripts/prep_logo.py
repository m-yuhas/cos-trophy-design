import argparse


import cv2
import numpy


parser = argparse.ArgumentParser(
    'Prepare a logo for import into OpenSCAD as an engraving -- ' \
    'the output file should be a black and white PNG image with reduced ' \
    'resolution and detailed features removed.'
)
parser.add_argument(
    'input_file',
    metavar='input-file',
    help='path to PNG file to convert',
)
parser.add_argument(
    'output_file',
    metavar='output_file',
    help='path to write converted file to',
)
parser.add_argument(
    '--scale-factor',
    '-s',
    help='scale-factor for resize',
    type=float,
    default=0.1,
)
args = parser.parse_args()

logo = cv2.imread(args.input_file)
logo = cv2.cvtColor(logo, cv2.COLOR_RGBA2GRAY)
logo = cv2.Canny(logo, 100, 200)
logo = cv2.dilate(logo, numpy.ones((15, 15), numpy.uint8), iterations=1)
logo = cv2.resize(logo, (0, 0), fx=args.scale_factor, fy=args.scale_factor)
cv2.imwrite(args.output_file, logo)

