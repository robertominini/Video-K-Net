cd /workspace/minini/Video-K-Net/data/cityscapes


wget --keep-session-cookies --save-cookies=cookies.txt --post-data 'username=robertominini&password=Cityscapes99!&submit=Login' https://www.cityscapes-dataset.com/login/

wget --load-cookies cookies.txt --content-disposition https://www.cityscapes-dataset.com/file-handling/?packageID=3