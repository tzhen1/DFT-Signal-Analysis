%𝑦[𝑛] – 𝑦[𝑛 − 1] + 0.9𝑦[𝑛 − 2] = 𝑥[𝑛]
impulse_seq(0,-20,120);

function [x,n] = impulse_seq(n0,n1,n2)
  if((n0<n1) | (n0>n2) | (n1>n2))
      error('error args');
  end
  a = [1, -1.9, 1]; % bracket nums
  b = [1]; % results val
  n = [n1:n2]; % range
  x = [(n-n0) == -1]; %start at -1
  h = filter(b,a,x);
  stem(n,h);

  grid on;
  title('Impulse Response');
  xlabel('(n)'); ylabel('h(n)');
end
