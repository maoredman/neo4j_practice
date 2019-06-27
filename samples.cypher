# create a node
create (:ToyNode {name: 'Harry'})

# delete a node (have to match before delete)
match (N:ToyNode {name: 'Harry'})
delete N

# create an edge and a node (`merge` only creates if target doesn't exist)
match (N:ToyNode {name: 'Harry'})
merge (N) - [:ToyRelation {relationship: 'co-worker'}] -> (:ToyNode {name: 'Julian', job: 'plumber'})

# see entire graph
match (n) return n;

# changing node properties
match (n:ToyNode) where n.name = 'Harry' set n.job = 'drummer'
match (n:ToyNode) where n.name = 'Harry' set n.job = n.job + ['lead guitarist']

# counting nodes
match (n:MyNode)
return count(n)

# counting edges
match (n:MyNode)-[r]->()
return count(r)

# get leaf nodes
match (m)
where not ((m)-[]->())
return m

# get root nodes
match (m)
where not (()-[]->(m))
return m