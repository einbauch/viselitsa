class WordReader

  def read_from_args
    ARGV[0]
  end

  def read_from_file(file_name)

    begin
      f = File.new(file_name, "r:UTF-8")
      lines = f.readlines
      f.close
    rescue Errno::ENOENT
      abort "Не найден файл: #{file_name}"
    end

    lines.sample.chomp
  
  end

end
