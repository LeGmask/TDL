Commandes pour générer un graphe d'un parser
`menhir --explain --dump --automaton-graph parser.mly`
Pour mettre le graphe dans le bon sens:
`sed "s/landscape/portrait/g" < parser.dot > parser.dot`
puis pour générer le graphe avec Graphviz
`dot -Tsvg parser.dot > img.svg`
