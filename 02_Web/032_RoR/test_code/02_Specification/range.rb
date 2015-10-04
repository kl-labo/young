p (1..5).include?(1)
p (1..5).include?(5)
p (1...5).include?(1)
p (1...5).include?(5)

vacation = Time.at(1343746800)..Time.at(1346425199)
p vacation.begin
p vacation.end

p abc = ('a'.. 'c')
p abc.include?('b')
p abc.include?('c')
p abc.include?('d')
