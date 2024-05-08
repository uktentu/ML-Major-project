
input_dir="$HOME/Desktop/Videos"
output_dir="$HOME/Desktop/outputvideos"

# output directory
mkdir -p "$output_dir"

# Loop on video files
for input_file in "$input_dir"/*.MOV; do
    # Extract the file name without the extension
    file_name=$(basename -- "$input_file")
    file_name_no_ext="${file_name%.*}"

    # downscale to 160x120, crop a 1:1 square, convert to black and white, and remove sound
    ffmpeg -i "$input_file" -vf "scale=160:120, crop=120:120, hue=s=0" -an -t 10 -c:v msmpeg4 -q:v 2 "$output_dir/$file_name_no_ext.avi"
done
