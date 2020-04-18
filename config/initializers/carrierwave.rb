require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage :fog
    config.fog_provider = 'fog/aws'
    config.fog_directory  = 'バケット名'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'AKIAVA62S7C6SQGVGWP2',
      aws_secret_access_key: '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',
      region: 'us-east-1',
      path_style: true
    }
  else
    config.storage :file
    config.enable_processing = false if Rails.env.test?
  end
end

CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/

