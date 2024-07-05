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
    file = File.open(BUFFER, 'w')
    File.foreach(BD_FILE).with_index do |actor, index|
        file.puts actor
    end
    File.foreach(BD_FILE).with_index do |actor, index|
        file.puts name if BD_FILE.size-3 == index+1 &&
    end
    file.close
    File.write(RESULT, File.read(BUFFER))
    File.delete(BUFFER) if File.exist?(BUFFER)
end

agePut=1
ageMassiv = []
puts 'Введите возраст для записи подходящих людей'
agePut = gets.to_i
ageMassiv.push(agePut)
while agePut!=-1
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
    if count == 0
        ageMassiv.push(agePut)
        updateRes(agePut)
    end
end
puts ageMassiv