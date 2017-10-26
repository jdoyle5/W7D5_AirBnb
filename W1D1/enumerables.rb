class Array
  def my_each(&prc)
    self.count.times do |i|
      prc.call(self[i])
    end
  end

  def my_select(&prc)
    selected = []
    self.my_each do |elem|
      selected << elem if prc.call(elem)
    end
    selected
  end

  def my_reject(&prc)
    rejected = []
    self.my_each do |elem|
      rejected << elem if !prc.call(elem)
    end
    rejected
  end

  def my_any?(&prc)
    !self.my_select {|el| prc.call(el)}.empty?
  end

  def my_all?(&prc)
    self.my_select {|el| prc.call(el)} == self
  end

  def my_flatten
    flattened = []
    self.my_each do |el|
      if el.is_a?(Array)
        flattened.concat(el.my_flatten)
      else
        flattened << el
      end
    end
    flattened
  end

  def my_zip(*args)
    zipped = []
    self.count.times do |i|
      small_zip = []
      small_zip << self[i]
        args.my_each do |el|
          small_zip << el[i]
        end
      zipped << small_zip
    end
    zipped
  end

  def my_rotate(num=1)
    self.drop(num % self.length) + self.take(num % self.length)
  end

  def my_join(sep='')
    joint = ''
    self.each_with_index do |el, i|
      if i == self.length - 1
        joint += el
      else
        joint += el + sep
      end
    end
    joint
  end

  def my_reverse
    reversed = []
    self.my_each do |let|
      reversed.unshift(let)
    end
    reversed
  end

end
