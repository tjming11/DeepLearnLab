function [ w_g, v_g, h_g ] = rbmGradients( rbm, batch, k)

batch_size = size(batch,1);

[h_0, v_k, h_k] = rbmSampleK(rbm, batch, k);

E_0 = zeros(rbm.n_h, rbm.n_v);
E_k = zeros(rbm.n_h, rbm.n_v);

for i=1:batch_size
    E_0 = E_0 + h_0(i,:)' * batch(i,:);
end

for i=1:batch_size
    E_k = E_k + h_k(i,:)' * v_k(i,:);
end

w_g = (E_0 - E_k)./batch_size
w_v = (sum(batch,1) - sum(v_k,1))/batch_size;
w_h = (sum(h_0,1) - sum(h_k,1))/batch_size;

end
