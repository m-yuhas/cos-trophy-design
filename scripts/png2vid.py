import argparse
import os


import cv2


parser = argparse.ArgumentParser('Convert folder of PNG images to MP4')
parser.add_argument(
    'input_folder',
    metavar='input-folder',
    help='input folder of PNG images (other files will be ignored); the PNG' \
         'images should retain the export name given by OpenSCAD, i.e., ' \
         '"frame<number>.png"',
)
parser.add_argument(
    'output_file',
    metavar='output-file',
    help='output MP4 movie',
)
args = parser.parse_args()

imglist = sorted(
    os.listdir(args.input_folder),
    key=lambda x: int(x.strip('frame').strip('.png')),
)
height, width, _ = cv2.imread(os.path.join(args.input_folder, imglist[0])).shape
writer = cv2.VideoWriter(
    args.output_file,
    cv2.VideoWriter_fourcc(*'MP4V'),
    fps=12.0,
    frameSize=(width, height),
)
for file in imglist:
    currfile = os.path.join(args.input_folder, file)
    if not currfile.endswith('.png'):
        continue
    writer.write(cv2.imread(currfile))
writer.release()
