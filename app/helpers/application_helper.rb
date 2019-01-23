module ApplicationHelper
  def insert_record(table, **attributes)
    connection = ActiveRecord::Base.connection
    attributes.merge!(
      updated_at: Time.now,
      created_at: Time.now,
    )

    insert <<-SQL.squish
      INSERT INTO #{table}
      (#{attributes.keys.join ", "})
      VALUES
      (#{attributes.values.map(&connection.method(:quote)).join ", "})
    SQL
  end
end
