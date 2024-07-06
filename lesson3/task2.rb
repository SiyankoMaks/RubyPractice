# Есть файл с 10 строками и структурой имя фамилия возраст
# Нужно прочитать файл, затем запросить ввод возраста у пользователя
# найти совпадение и записать в другой файл с название result.txt
# После перезапросить ввод. Программа завершается выводом результата
# если все студенты из первого файла были записаны во второй или
# пользователь ввел -1 

BD_FILE = 'bd.txt'
BUFFER = 'buffer.txt'
RESULT = 'result.txt'

def updateRes(num)
    file = File.open(BUFFER, 'a')
    File.foreach(BD_FILE).with_index do |actor, index|
        age = actor.split[2]
        file.puts actor if num.to_i == age.to_i
    end
    file.close
end

File.open(BUFFER, 'w')
agePut=1
ageMassiv = []
puts 'Введите возраст для записи подходящих людей'
agePut = gets.to_i
ageMassiv.push(agePut)
updateRes(agePut)
while agePut!=-1
    if BUFFER.size == BD_FILE.size
        puts 'Добавлены все люди из файла'
        break
    end
    puts 'Введите возраст для записи подходящих людей'
    agePut = gets.to_i
    for i in ageMassiv
        count = 0
        if i == agePut
            count += 1
            puts 'Введите другое число'
            break
        end
    end
    if count == 0 && agePut != -1
        ageMassiv.push(agePut)
        updateRes(agePut)
    end
    File.write(RESULT, File.read(BUFFER))
    file1 = File.open("bd.txt")
    file2 = File.open("result.txt")
    if file1.size + 2 == file2.size
        puts 'Добавлены все люди из исходного файла'
        break
    end
end
file = File.open(BUFFER, 'w')
file.close