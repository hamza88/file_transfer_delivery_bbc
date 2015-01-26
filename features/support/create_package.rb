require 'fileutils'
require 'find'

class CreatePackage

  def create_directory(package_id)
    package_id.slice!('/')
    @storage_folder = FileUtils.mkdir_p("features/fixtures/packages/complete_packages/Package_" + package_id)
    $storage_folder = @storage_folder
    $package_id = package_id
  end

  def determine_files(type, file_type)
    case type
      when 'media_file'
        puts "Looking for " + file_type
        find_and_copy_mxf_files
      when 'doc_type'
        puts "Looking for " + file_type
        find_and_copy_pdf_files
      when 'avi_file'
        puts "Looking for " + file_type
        find_and_copy_avi_files
      when 'non_dpp_media_file'
        puts "Looking for " + file_type
        find_and_copy_non_mxf_files
      when 'non_dpp_doc_type'
        puts "Looking for " + file_type
        find_and_copy_non_pdf_files
    end
  end

  def find_and_copy_non_mxf_files
    folder_path = "features/scratch_area/NON_DPP"
    files = Dir.glob(File.join(folder_path, "*.mxf"))
    puts files
    $storage_folder.to_s
    basedir = $storage_folder
    FileUtils.cp files, basedir
  end

  def find_and_copy_non_pdf_files
    folder_path = "features/scratch_area/NON_DPP"
    files = Dir.glob(File.join(folder_path, "*.pdf"))
    puts files
    $storage_folder.to_s
    basedir = $storage_folder
    FileUtils.cp files, basedir
  end

  def find_and_copy_avi_files
    folder_path = "features/scratch_area"
    files = Dir.glob(File.join(folder_path, "*.avi"))
    puts files
    $storage_folder.to_s
    basedir = $storage_folder
    FileUtils.cp files, basedir
  end

  def find_and_copy_mxf_files
    folder_path = "features/scratch_area"
    files = Dir.glob(File.join(folder_path, "*.mxf"))
    puts files
    $storage_folder.to_s
    basedir = $storage_folder
    FileUtils.cp files, basedir
  end
    def find_and_copy_pdf_files
    folder_path = "features/scratch_area"
    files = Dir.glob(File.join(folder_path, "*.pdf"))
    puts files
    $storage_folder.to_s
    basedir = $storage_folder
    FileUtils.cp files, basedir
    end

  def rename_files(package_id)
    package_id.slice!('/')
    basename = package_id
    folder_path = "features/scratch_area"
    media_files = Dir.glob(File.join(folder_path, "*.mxf"))
    pdf_files = Dir.glob(File.join(folder_path, "*.pdf"))
    puts media_files
    media_files.each do |f|
      File.rename(f, folder_path + "/" + basename.upcase + File.extname(f))
    end
    pdf_files.each do |f|
      File.rename(f, folder_path + "/" + basename.upcase + File.extname(f) )
    end
  end

  def move_files(file)
    folder_path = "features/scratch_area"
    files = Dir.glob(File.join(folder_path, "*.pdf"))
    basedir = $storage_folder
    FileUtils.cp files, basedir
  end

  # def find_package(file)
  #   $storage_folder = @storage_folder
  # end


end

# World(CreatePackage)