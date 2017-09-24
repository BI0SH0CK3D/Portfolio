import fasta

# initialize a protein squence from a fasta file 
# get_seq() method called upon __init__
talin = fasta.Sequence('talin.fasta')


# __init__ str allows for printing representations easily 
print(talin)


# show int of seq length 
print(talin.length())


# count residues by user-defined list, returns as dict with option for percent
philes = ["D", "E", "R", "K"]

talin_philes = talin.res_count(philes)

print(talin_philes)


talin_philes_percents = talin.res_count(philes, percent = True)

print(talin_philes_percents)


# find numberof kmers
ten_mers = talin.kmers(10)
print(ten_mers)
