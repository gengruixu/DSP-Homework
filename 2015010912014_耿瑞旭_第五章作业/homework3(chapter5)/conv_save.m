%%�ص���������������α�169ҳ 
function conv1 = overlapsave(x,h)
% x = ones(1,200) %���ڲ���
% for m = 1:1:200
%     x(m) = 8*rand(1)-4
% end
% % x = [2,-3,4,5,-6,7,8,-9,-10,11,-12,-13,-14]
% h = [1,-2,-3] %���ڲ���
%x�ĳ���ӦԶԶ����h�ĳ���
h = h'
len_x = length(x);
len_h = length(h);
M = len_h
len_conv = len_x + len_h -1
% temp = ceil(log2(len_h));
% N = 2^(temp);       %171ҳ�²���M��N
N = M+2
num = floor(len_x/M) +1    %��x��Ƭ������
x_m = zeros(num,N)      %��x�е�Ƭ��ÿһ�ж���һ��Ƭ
cir_m = zeros(num,len_conv)    %x��ÿ����Ƭ��y[n]�������һ������
%N��Բ�ܾ������M<=N,����Ҫ�������h���в�0����
if(N > len_h)
    for i = len_h+1:1:N
        h(1,i) = 0;
    end
end

%��x������Ƭ��ÿƬ����ΪN
iN = 1;   %��iN����Ƭ
iM = 1; %��Ƭ�еĵ�
% for m = 1:N:num*N
x_m(1,:) = [zeros(1,N-M) x(1,1:M)]
x_m(num,:) = [x(1,len_x-N+M-mod(len_x,M)+1:len_x) zeros(1,M-mod(len_x,M)) ]
for iN = 2:1:num-1
    for iM = 1:1:N
        x_m(iN,iM) = x(1,(iN-1)*M+(iM-N+M))
    end
%     cir_m(iN,1+(iN-1)*(N-M+1):1+(iN-1)*(N-M+1)+(N-1)) = circonv(x_m(iN,:),h)
end
for iN=1:1:num
    for iM=1:1:N
        if 1+(iN-1)*(N-M+1)+(N-1) < len_conv
            cir_m(iN,1+(iN-1)*(N-M+1):1+(iN-1)*(N-M+1)+(N-1)) = circonv(x_m(iN,:),h)
    
        end
        end
end
        % circonv()
% aban = M-1      %��ͷ����ȷ����Ҫ������

%ȥ��cir_mÿһ�е�ǰ(M-1)��Ԫ��
cir_m_del = cir_m;
for m =1:1:num
    cir_m_del(m,1+(m-1)*(N-M+1):1+(m-1)*(N-M+1)+(M-1-1)) = 0
end

%��cir_m_del�ϲ���Ϊһ�����������ɵõ����Ծ������
% conv = zeros(1,len_conv)
% conv = zeros(1,len_x)
conv2 = sum(cir_m_del)
conv1 = conv(x,h)
for iJ = 1:1:len_conv-2
    conv2(iJ) = conv2(iJ+2);
end

