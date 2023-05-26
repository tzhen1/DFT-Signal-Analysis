%𝑦[𝑛] – 𝑦[𝑛 − 1] + 0.9𝑦[𝑛 − 2] = 𝑥[𝑛]
step_seq(0,-20,120);


function [x,n] = step_seq(n0,n1,n2)
   if((n0<n1) | (n0>n2) | (n1>n2))
       error('error args');
   end

   a = [1, -1.9, 1]; % bracket nums
   b = [1]; % results val

   n = [n1:n2]; % range
   x = [(n-n0) >=2 ]; %start at -1

   s = filter(b,a,x);

   stem(n,s)
   grid on;
   title('Step Response');
   xlabel('(n)'); ylabel('s(n)');
end
