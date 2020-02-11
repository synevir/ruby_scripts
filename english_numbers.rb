################################################
#  Script convert digital number to words
################################################


def englishNumber(number)
  return 'input number greater than zerro' if (number < 0)
  return 'zerro' if (number == 0)

  ones = ['one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']
  tens =['ten', 'twenty',  'thirty',   'forty',    'fifty', 'sixty',   'seventy',   'eighty',   'ninety']
  teenage = ['eleven',  'twelve',    'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen']

  result=''

  left  = number
  write = left/1000000          #  millions are left to output
  left  = left - write*1000000

  if write > 0
     h1000000=englishNumber (write)
     result=result+h1000000 + ' million'
     if left>0
        result=result+' '
     end
  end

  write = left/1000             #  thousands are left to output
  left  = left - write*1000
  if write > 0
     h1000=englishNumber (write)
     result=result+h1000 + ' thousand'
     if left > 0
        result=result+' '
     end
  end


  write = left/100              #  hundreds are left to output
  left  = left - write*100
  if write > 0
     h100=englishNumber (write)
     result=result + h100  + ' hundred'
     if left > 0
        result=result+' '
     end
  end

  write = left/10               #  dozens are left to output
  left  = left - write*10
  if write > 0
     if (write==1) and (left>0)
         result=result + teenage[left-1]
         left=0
     else
         result=result + tens [write-1]
     end
     if left > 0
       result=result + '-'
    end
  end



  write=left
  if write > 0
     result=result +  ones [write-1]
  end

  result

end

#----------------------------
#        main code
#----------------------------
puts 'Input number less million'
n=gets.to_i

puts englishNumber(n)