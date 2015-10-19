languages = %w(Perl Python Ruby)
i = 0
while i < languages.length
  p languages[i]
  i += 1
end

# untilはwhileと逆の動きをする
i = 0
until languages.length <= i
  p languages[i]
  i+= 1
end

# 後置while、unless
i = 0
p i += 1 while i <languages.length
i=0
p i += i unless languages.length <= i

#do-while
i = 0
begin
p languages[i]
i += 1
end while i < languages.length

