from moviepy.editor import VideoFileClip

# Set the input and output directories
input_dir = "Videos"
output_dir = "outputvideos"

# Import the necessary video processing functions
def process_video(input_file, output_file):
    # Load the video clip
    clip = VideoFileClip(input_file)
    
    # Center-crop the video to 160x120
    clip = clip.crop(x_center=clip.w/2, y_center=clip.h/2, width=160, height=120)
    
    # Convert the video to black and white
    clip = clip.fx.vfx.colorx(1.0)
    
    # Set the video duration to 10 seconds
    clip = clip.subclip(0, 10)
    
    # Remove the audio
    clip = clip.set_audio(None)
    
    # Write the processed video to the output file
    clip.write_videofile(output_file, codec="msmpeg4", threads=4)

# Process all MOV files in the input directory
import os
for filename in os.listdir(input_dir):
    if filename.endswith(".MOV"):
        input_file = os.path.join(input_dir, filename)
        output_file = os.path.join(output_dir, filename.split(".")[0] + ".avi")
        process_video(input_file, output_file)
