image=imread('blurryImage.png');
cs = 3.;
cu = 0.5;
[h w d]=size(image);
U_dash = double(reshape(image,w*h,d))/255;
G = gradient(h,w);
g1 = G*U_dash(:,1);
g2 = G*U_dash(:,2);
g3 = G*U_dash(:,3);
%% Write your method here

A = G'*G + cu*speye(w*h);
b1 = cs*G'*g1 + cu*U_dash(:,1);
b2 = cs*G'*g2 + cu*U_dash(:,2);
b3 = cs*G'*g3 + cu*U_dash(:,3);

U1=A\b1;
U2=A\b2;
U3=A\b3;

U = [U1,U2,U3];

image2 = uint8(reshape(U,h,w,d)*255);

figure, imshow(image)
figure, imshow(image2)
%imwrite(image,'out.png')
