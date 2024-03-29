class CreateLicenses < ActiveRecord::Migration
  def change
    create_table :licenses do |t|
      t.belongs_to :organization,    null: false                # 机构的ID
      t.string     :engine_name,     null: false                # 插件的名称
      t.string     :expired_at,      null: false                # 过期时间
      t.integer    :max_num_seats,   default: 5                 # 最大人数
      t.string     :status                                      # 状态，审核通过还是未通过
      t.integer    :position                                    # 位置（预留字段）

      t.timestamps null: false
    end

    add_index :licenses, :organization_id

  end
end
