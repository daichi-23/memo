require "csv"
puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"
loop do
    memo_type = gets.to_i
    if memo_type == 1
        puts "拡張子を除いたファイルを入力してください"
        file_name = gets.chomp
        CSV.open("#{file_name}.csv", 'w', :quote_char => '')do |csv|
            puts "メモしたい内容を記入してください"
            puts "完了したらCtrl + Dをおします"
            new_memo = readlines.map(&:chomp)
            csv << new_memo
        end
        break
    elsif memo_type == 2
        puts "拡張子を除いた既存ファイルを入力してください"
        file_name = gets.chomp
        CSV.open("#{file_name}.csv", 'a', :quote_char => '')do |csv|
            puts "メモしたい内容を記入してください"
            puts "完了したらCtrl + Dをおします"
            edit_memo = readlines.map(&:chomp)
            csv << edit_memo
        end
        break
    else
        puts "1か2を入力してください"
    end
end

