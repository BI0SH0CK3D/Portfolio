#!python3
class Sequence(object):

    # read fasta file on initialization
    def __init__(self, filename):
        self.filename = filename
        self.sequence = self.get_seq(filename)

    # allow sequence to be displayed in text
    def __str__(self):
        return self.sequence

    # funciton that gets the sequence from FASTA
    def get_seq(self, filename):
        seq = ''
        data = open(filename, 'r').readlines()
        for line in data:
            if not line.startswith('>'): # skips header
                line = line.replace('\n', '')
                seq += line
        return seq

    # returns length to be seen as float
    def length(self):
        return float(len(self.sequence))

    # takes a list of residues to count and return dict or count or %
    def res_count(self, res_list, percent = False):
        res_dict = {}
        for res in res_list:
            res_count = self.sequence.count(res)
            res_dict[res] = res_count
        if percent == True:
            for res in res_dict:
                res_dict[res] = round((res_dict[res] / self.length()) * 100, 2)
        return res_dict

    # takes number for 'k', returns kmers in self.sequence
    def kmers(self, kmer_length):
        kmer_pool = []
        kmer_start = 0
        kmer_end = int(kmer_length)
        sequence_end = self.length()
        # increments along sequence, storing kmers
        while kmer_start + int(kmer_length) <= sequence_end:
            kmer = self.sequence[int(kmer_start):int(kmer_end)]
            kmer_pool.append(kmer)
            kmer_start += 1
            kmer_end += 1
        return kmer_pool

    # shows user the available methods.
    def show_methods(self):
        methods_list = """\n
        Methods:
        get_seq() # displays representation of sequence
        length()  # returns integer of length
        res_count() # takes list of residues, returns dicts of counts or %
        kmers(<value of 'k' for kmers>)\n"""
        print(methods_list)
