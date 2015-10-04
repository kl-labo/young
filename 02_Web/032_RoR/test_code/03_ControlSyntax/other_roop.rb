# loop
loop do
  p 'infinity?'
  break
end

# times
5.times do
  p 'print 5 times'
end

# each
languages = %w(Ruby Perl Java C#)
 languages.each do |language|
  p language
  next unless language == 'Java'
  p 'found Java'
  redo
end
