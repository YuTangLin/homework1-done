function output = my_imfilter(image, filter)
% This function is intended to behave like the built in function imfilter()
% See 'help imfilter' or 'help conv2'. While terms like "filtering" and
% "convolution" might be used interchangeably, and they are indeed nearly
% the same thing, there is a difference:
% from 'help filter2'
%    2-D correlation is related to 2-D convolution by a 180 degree rotation
%    of the filter matrix.

% Your function should work for color images. Simply filter each color
% channel independently.

% Your function should work for filters of any width and height
% combination, as long as the width and height are odd (e.g. 1, 7, 9). This
% restriction makes it unambigious which pixel in the filter is the center
% pixel.

% Boundary handling can be tricky. The filter can't be centered on pixels
% at the image boundary without parts of the filter being out of bounds. If
% you look at 'help conv2' and 'help imfilter' you see that they have
% several options to deal with boundaries. You should simply recreate the
% default behavior of imfilter -- pad the input image with zeros, and
% return a filtered image which matches the input resolution. A better
% approach is to mirror the image content over the boundaries for padding.

% % Uncomment if you want to simply call imfilter so you can see the desired
% % behavior. When you write your actual solution, you can't use imfilter,
% % filter2, conv2, etc. Simply loop over all the pixels and do the actual
% % computation. It might be slow.
% output = imfilter(image, filter);


%%%%%%%%%%%%%%%%
% Your code here - Version_1_Very Slow
%  [ix,iy,iz]=size(image);    % know the size of image
%  [fx,fy]=size(filter);      % know the size of filter,general result for any 2-D filter
%  
%  %extension
%  ex=(fx-1)/2;               % know how the filter extends the size of x
%  ey=(fy-1)/2;               % know how the filter extends the size of y
% 
%  yc=zeros(ix+2*ex,iy+2*ey,iz);      % creat the new size of the zeros matrix by filter/image
%  yc(ex+1:ix+ex,ey+1:iy+ey,:)=image; % put the image in the matrix
% for yz=1:iz                 % 2-D filter doesn't affect z-axis                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
%     for yx=1:ix             % filter starts from the first block of x-axis
%         for yy=1:iy         % filter starts from the first block of y-axis
%                 image1=yc(yx:yx+2*ex,yy:yy+2*ey,yz); % know how filter moves
%                 image2=filter.*image1;               % filtering
%                 new=sum(image2(:));                  % sum the value in matrix each time
%                 ycc(yx,yy,yz)=new;                   % resize the image to original size
%                 out=ycc;                             % output the image
%         end
%     end
% end
% output = out;
%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%
% Your code here - Version_2_Fast
  [ix,iy,iz]=size(image);    % know the size of image
  [fx,fy,fz]=size(filter);      % know the size of filter,general result for any 2-D filter 
%  %extension
  ex=(fx-1)/2;               % know how the filter extends the size of x
  ey=(fy-1)/2;               % know how the filter extends the size of y
 
  yc=zeros(ix+2*ex,iy+2*ey,iz);      % creat the new size of the zeros matrix by filter/image
  yc(ex+1:ix+ex,ey+1:iy+ey,:)=image; % put the image in the matrix
  
  for yz=1:iz                        % 2-D filter doesn't affect z-axis 
     for yx=1:ix                     % filter starts from the first block of x-axis
         for yy=1:iy                 % filter starts from the first block of y-axis
             sum=0;                  % initial value of sum
             for nx=1:fx             % filter x-axis size
                 for ny=1:fy         % filter y-axis size
                       mx=fx-2*ex-1; % index
                       my=fy-2*ey-1; % index
                     sum=sum+yc(yx-mx+nx-1,yy-my+ny-1,yz)*filter(nx,ny); % filtering + sum the value in matrix each time
                 end
             end
              ycc(yx,yy,yz)=sum;     %resize the image to original size
         end
     end 
 end
  output=ycc;
%%%%%%%%%%%%%%%%




