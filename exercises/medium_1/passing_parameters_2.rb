birds = ['crow', 'finch', 'hawk', 'eagle']

def types(array)
  yield(array)
end

raptors = types(birds) { |_,_, *raptors| raptors  }

p raptors
