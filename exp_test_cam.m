clc
clear

dev = serialport("COM3",9600);
flush(dev);
cam = webcam(2);
cam.AvailableResolutions
cam.Resolution = '1280x720';
%read(dev)
data = readline(dev);
data = readline(dev);

tic
for i=1:5000
data = readline(dev);
data = readline(dev);
sens(:,i)=str2num(data);
%read(dev,9,"int16")
img= snapshot(cam);
mark(:,:,i)=im2bw(rgb2gray(img),0.12);
flush(dev);
end
toc
%preview(cam)


save('b.mat','-v7.3')
clear cam
clear dev
