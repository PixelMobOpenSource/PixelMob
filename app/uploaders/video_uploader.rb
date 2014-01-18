# encoding: utf-8
class VideoUploader < CarrierWave::Uploader::Base
    include ::CarrierWave::Backgrounder::Delay
    include CarrierWave::Video::Thumbnailer
    include CarrierWave::Video
    storage :file
        version :hd1080p, :if => :is_1080p? do
            process encode_video: [:mp4, resolution: '1920x1080', progress: :progressCallback]
        end
    version :hd720p, :if => :is_720p? do
        process encode_video: [:mp4, resolution: '1280x720', progress: :progressCallback ]
    end
    version :sd do
        process encode_video: [:mp4, resolution: '640x360',    progress: :progressCallback, callbacks: {after_transcode: :encodeCallback360p}]
    end
    version :poster do
        process get_thumb: ['png',"640x360" , 1]
        def full_filename for_file
            png_name for_file, version_name
        end
    end
    version :thumb do
        process get_thumb: ['png',"260x135" , 1]
        def full_filename for_file
            png_name for_file, version_name
        end
    end
    def store_dir
            "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end
    def png_name for_file, version_name
        %Q{#{version_name}_#{for_file.chomp(File.extname(for_file))}.png}
    end
end
