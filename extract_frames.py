import sys
import cv2
import os
import numpy as np

VIDEO_PATH = sys.argv[1]
RESULT_PATH = sys.argv[2] #folder where we save the images
try:
    FRAME_RATE = float(sys.argv[3]) #
except:
    FRAME_RATE = 20

try:
    SECONDS_TO_EXTRACT = float(sys.argv[4])
except:
    SECONDS_TO_EXTRACT = np.inf

print(f"Argument 1: {VIDEO_PATH}")
print(f"Argument 2: {RESULT_PATH}")
print(f"Argument 3: {FRAME_RATE}")
print(f"Argument 3: {SECONDS_TO_EXTRACT}")
print("Current working directory is", os.getcwd())

absolute_counter = 0
# Open the video file
cap = cv2.VideoCapture(VIDEO_PATH)

# Get the frame rate of the video
fps = cap.get(cv2.CAP_PROP_FPS)

# Set the frame rate for extraction
frame_rate = FRAME_RATE

# Calculate the interval between frames
interval = round(fps / frame_rate)

# Initialize a counter for the extracted frames
count = 0

# Initialize a variable for the elapsed time
elapsed_time = 0

# Loop through the video frames

while cap.isOpened() and elapsed_time < SECONDS_TO_EXTRACT:

    
    # Read a frame from the video
    ret, frame = cap.read()

    # Check if the frame was read successfully
    if not ret:
        break

    # Check if the frame should be extracted
    if count % interval == 0:
        # Save the frame as an image file
        cv2.imwrite(f'{RESULT_PATH}/000002_{absolute_counter:06d}_leftImg8bit.png', frame)
        absolute_counter += 1

    # Increment the frame counter and elapsed time
    count += 1
    elapsed_time = count / fps

# Release the video capture object and close the window
cap.release()
cv2.destroyAllWindows()


print("Extraction done!")