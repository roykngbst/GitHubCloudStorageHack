import os
import subprocess
import math

# Set the directory you want to start from
rootDir = '.'

for dirName, subdirList, fileList in os.walk(rootDir):
    for fname in fileList:
        file_path = os.path.join(dirName, fname)
        file_size = os.path.getsize(file_path) / (1024 * 1024)  # Get file size in MB

        if file_size > 50:
            print(f'Processing file: {file_path}')
            print(f'File size: {file_size} MB')

            # Calculate the number of segments needed
            num_segments = math.ceil(file_size / 50)

            # Get the total duration of the video file
            result = subprocess.run(['ffprobe', '-v', 'error', '-show_entries', 'format=duration', '-of', 'default=noprint_wrappers=1:nokey=1', file_path], stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
            total_duration = float(result.stdout)

            # Calculate the duration for each segment
            segment_duration = total_duration / num_segments

            # Get the base name of the file (without directories and extension)
            base_name = os.path.splitext(os.path.basename(file_path))[0]

            # Create a new directory with the same name as the base name of the input file
            output_dir = os.path.join('small_cuttings50and100', base_name)
            os.makedirs(output_dir, exist_ok=True)

            # Split the file into segments
            subprocess.run(['ffmpeg', '-i', file_path, '-c', 'copy', '-map', '0', '-f', 'segment', '-segment_time', str(segment_duration), os.path.join(output_dir, f'{base_name}%03d.mov')])
 
