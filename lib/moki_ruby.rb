require "moki_ruby/version"

module MokiRuby
  def self.action(device_id, action_id)
    data = MokiAPI.action(device_id, action_id).value
    Action.from_hash(data.body)
  end

  def self.ios_profiles
    data = MokiAPI.ios_profiles.value
    data.body.map { |profile| IOSProfile.from_hash(profile) }
  end

  def self.tenant_managed_apps
    data = MokiAPI.tenant_managed_app_list.value
    data.body.map { |profile| TenantManagedApp.from_hash(profile) }
  end
end
