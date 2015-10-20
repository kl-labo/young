# 配列
people = ['Alice', nil, 1]

p people[0]   # Alice
p people[1]   # nil
p people[2]   # 1

# 連想配列（キーには可読性向上のためシンボルがよく用いられる）
colors = {:red => 'ff0000', :green => '00ff00', :blue => '0000ff'}

p colors[:red]      # ff0000
p colors[:green]    # 00ff00
p colors[:blue]     # 0000ff
