class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(strand2)
    strands = [@strand, strand2].sort_by(&:length)
    shorter = strands.first
    longer = strands.last
    count = 0
    shorter.chars.each_with_index do |letter, idx|
      count += 1 if letter != longer[idx]
    end
    count
  end
end
