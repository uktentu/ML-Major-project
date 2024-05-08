#!/bin/bash

# Source directory containing the video files
source_dir="$HOME/Desktop/outputvideos"

# Target directory to save the generated GIFs
target_dir="$HOME/Desktop/output_gifs"

# Create the target directory if it doesn't exist
mkdir -p "$target_dir"

# Iterate through the video files in the source directory
for video_file in "$source_dir"/*.avi; do
    if [ -f "$video_file" ]; then
        # Extract the base filename without the extension
        base_filename=$(basename -- "$video_file")
        base_filename_no_ext="${base_filename%.*}"

        # Generate the GIF file with the same name in the target directory
        gif_file="$target_dir/$base_filename_no_ext.gif"
        ffmpeg -i "$video_file" -vf "fps=10,scale=160:-1:flags=lanczos" "$gif_file"

        echo "Converted $video_file to $gif_file"
    fi
done

echo "Conversion to GIFs completed."
