def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, amount)
  pet_shop[:admin][:total_cash] += amount
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, num_pets)
  pet_shop[:admin][:pets_sold] += num_pets

end

def stock_count(pet_shop)
  return pet_shop[:pets].count()
end

def pets_by_breed(pet_shop, search_breed)
  find_pets_by_breed = []
  for pet in pet_shop[:pets]
    find_pets_by_breed.push(pet[:breed]) if pet[:breed] == search_breed
  end
  return find_pets_by_breed
end

def find_pet_by_name(pet_shop, name)
  for pet in pet_shop[:pets]
#HW REVISION #: 21/01/2019, 14:20:01 use == for comparison instead of include method. See solution
    return pet if pet[:name].include?(name)
  end
  return nil
end

def remove_pet_by_name(pet_shop, name)
  for pet in pet_shop[:pets]
#HW REVISION  #: 21/01/2019, 14:20:30 use find_pet_by_name
    pet_shop[:pets].delete(pet) if pet[:name].include?(name)

  end
end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets].push(new_pet)
end

def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer, cash)
  customer[:cash] -= cash
end

def customer_pet_count(customer)
  customer[:pets].count()
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets].push(new_pet)
end

def customer_can_afford_pet(customer, new_pet)
  # Refactored this if clause to a ternary if
  # return false if customer[:cash] < new_pet[:price]
  # return true
  customer[:cash] < new_pet[:price] ? false : true
end


def sell_pet_to_customer(pet_shop, new_pet, customer)
# HW REVISION #: 21/01/2019, 14:20:45 check solution to replace if new_pet is hash
  if new_pet.is_a? Hash
    for pet in pet_shop[:pets]
      if customer_can_afford_pet(customer, new_pet) && pet[:name] == new_pet[:name]

        add_pet_to_customer(customer, pet)

        remove_pet_by_name(pet_shop, pet[:name])

        increase_pets_sold(pet_shop, 1)

        remove_customer_cash(customer, pet[:price])

        add_or_remove_cash(pet_shop, pet[:price])
      end
    end
  end
end
