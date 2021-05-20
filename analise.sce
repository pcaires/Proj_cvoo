clear
exec('dinamica.sce',-1)
s = poly(0,'s')

// Função de transeferencia entrada em da e saida em bb
C = [1 0 0 0 0]
G = C*inv(s*eye(5,5)-A)*B(:,2)

evans(G,[30]) // Root locus G
