class ATM
  def withdraw(value)
    bills = [100, 50, 20, 10]
    bills_to_return = []

    if value % bills.min != 0
      raise
    end

    bills.each do |bill|
       temp = value / bill
       if temp > 0
         bills_to_return << [temp, bill]
         value -= temp * bill
       end
    end

    bills_to_return
  end
end
