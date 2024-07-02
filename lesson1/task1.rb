print("Введите имя, фамилию и возраст")
name = gets.to_s
surname = gets.to_s
age = gets.to_i
 if age>18
    print("Привет, "+name+" "+surname+". Тебе меньше 18, можно начинать учиться программировать")
 else
    print("Привет, "+name+" "+surname+", Самое время работать.")
 end