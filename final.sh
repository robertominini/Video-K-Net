#codes to run to extract frames, do inference and create gif

#first we have to extract frames (CHANGE VIDEO.MP4 to actual name of the video, and frames to the folder where you want to save the frames). The third argument is the fps rate, and the last argument is how many seconds to extract.

bash extract_frames.sh video/video.mp4 frames 20 30

# then we have to copy this frames to the right folder


#PROCEDURE TO TRY THE FRAMES EXTRACTED

rm ./data/inference_folder/video_sequence/val/* #emptying the folder

cp ./frames/* ./data/inference_folder/video_sequence/val #copying the frames to the folder (we are assuming you already generated them with notebook


rm -r ./risultati_predictions/* #we empty the prediction folder

bash ./tools/inference.sh configs/video_knet_kitti_step/video_knet_s3_r50_rpn_1x_kitti_step_sigmoid_stride2_mask_embed_link_ffn_joint_train.py ./weights/knet_city_step_pan_r50.pth ./risultati_predictions #running the inference


# THEN WE WANT TO CREATE THE GIFS