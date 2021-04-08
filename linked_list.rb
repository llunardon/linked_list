require_relative 'node.rb'

class LinkedList
  attr_reader :size

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next_node = @tail
    @size = 2
  end

  def append(value)
    if @tail.value != nil
      new_tail = Node.new
      new_tail.value = value
      @tail.next_node = new_tail
      @tail = new_tail

      @size += 1
    else
      @tail.value = value
    end
  end

  def prepend(value)
    if @head.value != nil
      new_head = Node.new
      new_head.value = value
      new_head.next_node = @head
      @head = new_head

      @size += 1
    else
      @head.value = value
    end
  end

  def head
    @head
  end

  def tail
    @tail
  end

  def at(index)
    if index > size - 1 
      puts 'Index is too large'
      return nil
    end

    curr = @head
    i = 0

    until i == index do
      curr = curr.next_node
      i += 1
    end

    curr
  end

  def pop
    curr = @head

    until curr.next_node == tail do
      curr = curr.next_node
    end 

    old_tail = @tail

    @tail = curr
    @tail.next_node = nil

    old_tail
  end

  def contains?(value)
    curr = @head
    found = false

    until curr.next_node == nil do
      if curr.value == value
        found = true
      end

      curr = curr.next_node
    end

    found
  end

  def find(value)
    curr = @head
    i = 0
    ret_value = nil

    until curr.next_node == nil do
      if (curr.value == value)
        ret_value = i
        return ret_value
      end

      i += 1
    end

    ret_value
  end

  def to_s
    curr = @head

    until curr == @tail.next_node do
      print "(#{curr.value}) -> "

      curr = curr.next_node
    end

    puts ''
  end
end
#
#linked_list = LinkedList.new
#linked_list.prepend(3)
#linked_list.append(2)
#linked_list.append(5)
#linked_list.prepend(7)
#linked_list.to_s
#
#puts "head: #{linked_list.head.value}"
#puts "tail: #{linked_list.tail.value}"
