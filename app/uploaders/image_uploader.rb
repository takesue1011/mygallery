# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick   # リサイズしたり画像形式を変更するのに必要

  process :resize_to_limit => [700, 700]  # 画像の上限を700pxにする

  process :convert => 'jpg'  # 保存形式をJPGにする

  version :thumb do  # サムネイルを生成する設定
    process :resize_to_limit => [300, 300]
  end

  def extension_white_list  # jpg,jpeg,gif,pngしか受け付けない
    %w(jpg jpeg gif png)
  end

  def original_filename  # 拡張子が同じでないとGIFをJPGとかにコンバートできないので、ファイル名を変更
    super.chomp(File.extname(super)) + '.jpg' if original_filename.present?
  end

  def filename  # ファイル名は日本語が入ってくると嫌なので、下記のようにしてみてもいい
    # 日付(20131001.jpgみたいなファイル名)で保存する
    time = Time.now
    name = time.strftime('%Y%m%d%H%M%S') + '.jpg'
    name.downcase
  end

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

end