function [BackSlash, Inte, Bayes] = CargaSimpl(Sim)
SimN = length(Sim);
SimN = SimN -1;
InteRein = zeros(SimN+1,1);
BayeRein = zeros(SimN+1,1);
BackSlash = zeros(SimN+1,1);


for i = 1:(SimN+1)
	InteRein(i) = Sim{i}.Integral(1);
	BayeRein(i) = Sim{i}.Bayes(1);
	BackSlash(i) = Sim{i}.BackSlash;
end

Inte = InteRein;
Bayes = BayeRein;

end
