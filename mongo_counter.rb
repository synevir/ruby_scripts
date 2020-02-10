############################################################
# mongo_counter.rb    Examples of update counter in MongoDB
############################################################

require 'mongo'

client = Mongo::Client.new('mongodb://127.0.0.1:27017/test')
collection = client[:counter]
counter_value = collection.find().first[:"val"].to_int
puts "Counter before = #{counter_value}"
counter_value = counter_value + 1


#   вариант без $set заменяет полностью документ. ниже код сработает только при условии, что 
#   в документе только одно поле
# result = collection.update_one({ "_id":"a" }, { "val": counter_value })


#   функция $findandupdate() возвращает документ, поэтому для проверки успешности вставки не подходит
# result = collection.find({"_id":"a"}).find_one_and_update('$set' => {:val => counter_value})


#   ***********   ruby style   **************
result = collection.find(:_id  => "a").update_one(:val => counter_value)


#   ***********   BSON style   ***************
# result = collection.update_one(
#             { "_id":"a" },
#             { '$set' => {:val => counter_value }}
#         )

if (result.n)
    puts "Counter after= #{counter_value}"
else
    puts 'Error insert_one() function'
end
