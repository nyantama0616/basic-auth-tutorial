class User < ApplicationRecord
    validates :user_id, uniqueness: true #同一のuser_idがデータベースに保存されないようにしている
    
    #他にも細かいバリデーションを設定したい場合は、ここに書こう！
end
