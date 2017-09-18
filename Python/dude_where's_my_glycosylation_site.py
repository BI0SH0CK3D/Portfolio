import re 

# get sequence from fasta file
def get_sequence(infile):
    input_sequence = open(infile).readlines()[1:]
    clean_sequence = []
    for line in input_sequence:
        clean_line = line.replace("\n", "")
        clean_sequence.append(clean_line)
    sequence = "".join(clean_sequence)
    return sequence

sequence = get_sequence('talin.fasta')

# find potential n-linked glycolysation sites
sites = re.findall('N[^P][ST]', sequence)
for site in sites:
	print(site, int(sequence.index(site) + 1))

